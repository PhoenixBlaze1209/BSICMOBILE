import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:relay/features/tasks/domain/task.dart';

part 'local_database.g.dart';

class CachedTasks extends Table {
  TextColumn get id => text()();
  TextColumn get orgId => text()();
  TextColumn get json => text()();
  IntColumn get version => integer()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class OutboxEntries extends Table {
  TextColumn get id => text()();
  TextColumn get aggregateId => text()();
  TextColumn get operation => text()();
  TextColumn get payload => text()();
  IntColumn get expectedVersion => integer()();
  IntColumn get attempts => integer().withDefault(const Constant(0))();
  DateTimeColumn get nextAttemptAt => dateTime()();
  TextColumn get lastError => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DriftDatabase(tables: [CachedTasks, OutboxEntries])
class RelayDatabase extends _$RelayDatabase {
  RelayDatabase() : super(driftDatabase(name: 'relay'));

  RelayDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;

  Stream<List<Task>> watchOrgTasks(String organizationId) =>
      (select(
        cachedTasks,
      )..where((row) => row.orgId.equals(organizationId))).watch().map(
        (rows) => rows
            .map(
              (row) => Task.fromJson(
                (jsonDecode(row.json) as Map<Object?, Object?>)
                    .cast<String, Object?>(),
              ),
            )
            .toList(growable: false),
      );

  Future<void> cacheTask(Task task) => into(cachedTasks).insertOnConflictUpdate(
    CachedTasksCompanion.insert(
      id: task.id,
      orgId: task.orgId,
      json: jsonEncode(task.toJson()),
      version: task.version,
      updatedAt: task.updatedAt,
    ),
  );
}

final class OutboxProcessor {
  OutboxProcessor({required this.database, required this.send});

  final RelayDatabase database;
  final Future<void> Function(OutboxEntry entry) send;

  Future<void> process(DateTime now) async {
    final due =
        await (database.select(database.outboxEntries)
              ..where((row) => row.nextAttemptAt.isSmallerOrEqualValue(now))
              ..orderBy([(row) => OrderingTerm.asc(row.createdAt)]))
            .get();
    for (final entry in due) {
      try {
        await send(entry);
        await (database.delete(
          database.outboxEntries,
        )..where((row) => row.id.equals(entry.id))).go();
      } on Object catch (error) {
        final attempts = entry.attempts + 1;
        final seconds = (1 << attempts.clamp(0, 8)) * 5;
        await (database.update(
          database.outboxEntries,
        )..where((row) => row.id.equals(entry.id))).write(
          OutboxEntriesCompanion(
            attempts: Value(attempts),
            nextAttemptAt: Value(now.add(Duration(seconds: seconds))),
            lastError: Value(error.runtimeType.toString()),
          ),
        );
      }
    }
  }
}
