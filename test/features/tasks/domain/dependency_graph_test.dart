import 'package:flutter_test/flutter_test.dart';
import 'package:relay/core/result.dart';
import 'package:relay/features/tasks/domain/dependency_graph.dart';

void main() {
  const graph = DependencyGraph();
  test('rejects a transitive cycle', () {
    final result = graph.validateEdge(
      taskId: 'a',
      dependencyId: 'c',
      edges: {
        'c': {'b'},
        'b': {'a'},
      },
    );
    expect(result, isA<Error<Unit>>());
  });

  test('counts transitive dependents once', () {
    expect(
      graph.transitiveDependents('a', {
        'b': {'a'},
        'c': {'b'},
        'd': {'a', 'c'},
      }),
      3,
    );
  });
}
