import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:relay/core/failure.dart';
import 'package:relay/core/result.dart';
import 'package:relay/features/tasks/domain/repositories.dart';
import 'package:relay/features/tasks/domain/task.dart';

final class FirebaseTaskRepository implements TaskRepository {
  FirebaseTaskRepository(this.firestore);

  final FirebaseFirestore firestore;

  CollectionReference<Task> _tasks(String orgId) => firestore
      .collection('orgs')
      .doc(orgId)
      .collection('tasks')
      .withConverter<Task>(
        fromFirestore: (snapshot, _) => Task.fromJson(
          _fromFirestore(snapshot.data() ?? const <String, Object?>{}),
        ),
        toFirestore: (task, _) => _toFirestore(task),
      );

  Map<String, Object?> _fromFirestore(Map<String, Object?> data) =>
      data.map((key, value) {
        final converted = value is Timestamp
            ? value.toDate().toIso8601String()
            : value;
        return MapEntry<String, Object?>(key, converted);
      });

  Map<String, Object?> _toFirestore(Task task) {
    final json = task.toJson().map((key, value) {
      final converted = value is String && key.endsWith('At')
          ? Timestamp.fromDate(DateTime.parse(value))
          : value;
      return MapEntry<String, Object?>(key, converted);
    });
    final words = '${task.title} ${task.description}'
        .toLowerCase()
        .split(RegExp('[^a-z0-9]+'))
        .where((word) => word.isNotEmpty)
        .toSet()
        .take(100)
        .toList(growable: false);
    return <String, Object?>{...json, 'searchTokens': words};
  }

  @override
  Future<Result<Task>> getTask(String orgId, String taskId) async {
    try {
      final snapshot = await _tasks(orgId).doc(taskId).get();
      final task = snapshot.data();
      return task == null
          ? const Error<Task>(NotFoundFailure('Task not found.'))
          : Success<Task>(task);
    } on FirebaseException catch (error) {
      return Error<Task>(_firebaseFailure(error));
    }
  }

  @override
  Stream<Result<Task>> watchTask(String orgId, String taskId) => _tasks(orgId)
      .doc(taskId)
      .snapshots()
      .map<Result<Task>>((snapshot) {
        final task = snapshot.data();
        return task == null
            ? const Error<Task>(NotFoundFailure('Task not found.'))
            : Success<Task>(task);
      })
      .handleError(
        (Object error) =>
            Error<Task>(NetworkFailure(error.runtimeType.toString())),
      );

  Stream<Result<List<Task>>> _watchQuery(Query<Task> query) =>
      query.snapshots().map<Result<List<Task>>>(
        (snapshot) => Success<List<Task>>(
          snapshot.docs.map((doc) => doc.data()).toList(growable: false),
        ),
      );

  @override
  Stream<Result<List<Task>>> watchMyTasks(String orgId, String userId) =>
      _watchQuery(_tasks(orgId).where('assigneeId', isEqualTo: userId));

  @override
  Stream<Result<List<Task>>> watchDelegatedByMe(String orgId, String userId) =>
      _watchQuery(_tasks(orgId).where('creatorId', isEqualTo: userId));

  @override
  Stream<Result<List<Task>>> watchTeamTasks(String orgId, String teamId) =>
      _watchQuery(_tasks(orgId).where('teamId', isEqualTo: teamId));

  @override
  Future<Result<Page<Task>>> searchTasks({
    required String orgId,
    required String query,
    required int limit,
    String? cursor,
  }) async {
    try {
      var request = _tasks(orgId)
          .where('searchTokens', arrayContains: query.toLowerCase())
          .limit(limit);
      if (cursor != null) {
        final cursorDoc = await _tasks(orgId).doc(cursor).get();
        if (cursorDoc.exists) request = request.startAfterDocument(cursorDoc);
      }
      final snapshot = await request.get();
      return Success<Page<Task>>(
        Page<Task>(
          items: snapshot.docs.map((doc) => doc.data()).toList(growable: false),
          nextCursor: snapshot.docs.length == limit
              ? snapshot.docs.last.id
              : null,
        ),
      );
    } on FirebaseException catch (error) {
      return Error<Page<Task>>(_firebaseFailure(error));
    }
  }

  @override
  Future<Result<Task>> save(TaskMutation mutation) async {
    try {
      final ref = _tasks(mutation.task.orgId).doc(mutation.task.id);
      await firestore.runTransaction((transaction) async {
        final current = await transaction.get(ref);
        final currentTask = current.data();
        if (currentTask != null &&
            mutation.task.version != currentTask.version + 1) {
          throw StateError('version-conflict:${currentTask.version}');
        }
        transaction.set(ref, mutation.task);
        transaction.set(
          ref.collection('activities').doc(mutation.activity.id),
          mutation.activity.toJson(),
        );
      });
      return Success<Task>(mutation.task);
    } on StateError catch (error) {
      final version = int.tryParse(error.message.split(':').last) ?? 0;
      return Error<Task>(
        ConflictFailure(
          'Task changed on another device.',
          remoteVersion: version,
        ),
      );
    } on FirebaseException catch (error) {
      return Error<Task>(_firebaseFailure(error));
    }
  }

  @override
  Future<Result<Task>> softDelete({
    required Task task,
    required TaskActivity activity,
  }) => save(TaskMutation(task: task, activity: activity));

  @override
  Future<List<ItemResult<Task>>> saveAll(List<TaskMutation> mutations) async {
    final output = <ItemResult<Task>>[];
    for (final mutation in mutations) {
      output.add(
        ItemResult<Task>(id: mutation.task.id, result: await save(mutation)),
      );
    }
    return output;
  }

  @override
  Future<Result<Unit>> addComment({
    required String orgId,
    required String taskId,
    required String actorId,
    required String markdown,
    required DateTime createdAt,
  }) async {
    try {
      await _tasks(orgId)
          .doc(taskId)
          .collection('comments')
          .add(<String, Object?>{
            'actorId': actorId,
            'markdown': markdown,
            'createdAt': Timestamp.fromDate(createdAt),
          });
      return const Success<Unit>(unit);
    } on FirebaseException catch (error) {
      return Error<Unit>(_firebaseFailure(error));
    }
  }

  Failure _firebaseFailure(FirebaseException error) => switch (error.code) {
    'permission-denied' => const PermissionDeniedFailure(
      'You no longer have access.',
    ),
    'unavailable' => const NetworkFailure(
      'Service is temporarily unavailable.',
    ),
    _ => UnexpectedFailure('Firebase request failed: ${error.code}.'),
  };
}
