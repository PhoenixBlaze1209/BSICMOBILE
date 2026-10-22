import 'package:relay/core/failure.dart';
import 'package:relay/core/result.dart';

final class DependencyGraph {
  const DependencyGraph();

  Result<Unit> validateEdge({
    required String taskId,
    required String dependencyId,
    required Map<String, Set<String>> edges,
  }) {
    if (taskId == dependencyId || _reachable(dependencyId, taskId, edges)) {
      return const Error<Unit>(
        CyclicDependencyFailure('The dependency would create a cycle.'),
      );
    }
    return const Success<Unit>(unit);
  }

  int transitiveDependents(String taskId, Map<String, Set<String>> edges) {
    final reverse = <String, Set<String>>{};
    for (final entry in edges.entries) {
      for (final dependency in entry.value) {
        reverse.putIfAbsent(dependency, () => <String>{}).add(entry.key);
      }
    }
    final seen = <String>{};
    final stack = <String>[taskId];
    while (stack.isNotEmpty) {
      final current = stack.removeLast();
      for (final dependent in reverse[current] ?? const <String>{}) {
        if (seen.add(dependent)) stack.add(dependent);
      }
    }
    return seen.length;
  }

  bool _reachable(String start, String target, Map<String, Set<String>> edges) {
    final seen = <String>{};
    final stack = <String>[start];
    while (stack.isNotEmpty) {
      final current = stack.removeLast();
      if (current == target) return true;
      if (!seen.add(current)) continue;
      stack.addAll(edges[current] ?? const <String>{});
    }
    return false;
  }
}
