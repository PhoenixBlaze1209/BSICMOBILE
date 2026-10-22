import 'package:relay/core/result.dart';
import 'package:relay/features/escalation/domain/escalation_models.dart';
import 'package:relay/features/organization/domain/organization_models.dart';
import 'package:relay/features/tasks/domain/task.dart';

final class Page<T> {
  const Page({required this.items, this.nextCursor});

  final List<T> items;
  final String? nextCursor;
}

final class ItemResult<T> {
  const ItemResult({required this.id, required this.result});

  final String id;
  final Result<T> result;
}

abstract interface class TaskRepository {
  Future<Result<Task>> getTask(String orgId, String taskId);
  Stream<Result<Task>> watchTask(String orgId, String taskId);
  Stream<Result<List<Task>>> watchMyTasks(String orgId, String userId);
  Stream<Result<List<Task>>> watchDelegatedByMe(String orgId, String userId);
  Stream<Result<List<Task>>> watchTeamTasks(String orgId, String teamId);
  Future<Result<Page<Task>>> searchTasks({
    required String orgId,
    required String query,
    required int limit,
    String? cursor,
  });
  Future<Result<Task>> save(TaskMutation mutation);
  Future<Result<Task>> softDelete({
    required Task task,
    required TaskActivity activity,
  });
  Future<List<ItemResult<Task>>> saveAll(List<TaskMutation> mutations);
  Future<Result<Unit>> addComment({
    required String orgId,
    required String taskId,
    required String actorId,
    required String markdown,
    required DateTime createdAt,
  });
}

abstract interface class OrgRepository {
  Future<Result<Organization>> getOrganization(String orgId);
  Future<Result<Membership>> getMembership(String orgId, String userId);
  Future<Result<List<Membership>>> getMemberships(String orgId);
}

abstract interface class UserRepository {
  Future<Result<Map<String, Object?>>> getUser(String userId);
}

abstract interface class EscalationRepository {
  Future<Result<EscalationPolicy>> getPolicy(String orgId, String policyId);
  Stream<Result<List<EscalationEvent>>> watchEvents(
    String orgId,
    String taskId,
  );
  Future<Result<Unit>> requestManualEscalation({
    required String orgId,
    required String taskId,
    required String actorId,
    required String reason,
    required int expectedVersion,
  });
  Future<Result<Unit>> resolveEscalation({
    required String orgId,
    required String taskId,
    required String actorId,
    required String reason,
    required int expectedVersion,
  });
}

abstract interface class NotificationRepository {
  Stream<Result<List<Map<String, Object?>>>> watchInbox(String userId);
  Future<Result<Unit>> markRead(String notificationId);
  Future<Result<Unit>> registerToken(String userId, String token);
}

abstract interface class AttachmentRepository {
  Future<Result<String>> upload({
    required String orgId,
    required String taskId,
    required String name,
    required String mimeType,
    required List<int> bytes,
  });
}

abstract interface class AuthRepository {
  Stream<String?> watchUserId();
  Future<Result<String>> signInWithEmail(String email, String password);
  Future<Result<String>> signInWithGoogle();
  Future<Result<String>> signInWithApple();
  Future<Result<Unit>> signOut();
}
