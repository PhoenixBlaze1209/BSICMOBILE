import 'package:relay/core/failure.dart';
import 'package:relay/core/result.dart';

final class ConflictResolver {
  const ConflictResolver();

  Result<Map<String, Object?>> merge({
    required Map<String, Object?> base,
    required Map<String, Object?> local,
    required Map<String, Object?> remote,
  }) {
    final localChanged = _changedKeys(base, local);
    final remoteChanged = _changedKeys(base, remote);
    final overlap = localChanged.intersection(remoteChanged);
    final conflicting = overlap.where((key) => local[key] != remote[key]);
    if (conflicting.isNotEmpty) {
      return Error<Map<String, Object?>>(
        ConflictFailure(
          'Both versions changed: ${conflicting.join(', ')}.',
          remoteVersion: (remote['version'] as int?) ?? 0,
        ),
      );
    }
    return Success<Map<String, Object?>>(<String, Object?>{
      ...remote,
      for (final key in localChanged) key: local[key],
    });
  }

  Set<String> _changedKeys(
    Map<String, Object?> base,
    Map<String, Object?> changed,
  ) => changed.keys.where((key) => changed[key] != base[key]).toSet();
}
