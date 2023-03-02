import 'package:test/test.dart';

import 'package:dart_shortest_path/graph.dart';
import 'package:dart_shortest_path/node.dart';

void main() {
  group('Graph test =>', () {
    final Node nodeA = Node('A', <Node>[], 10);
    final Node nodeB = Node('B', <Node>[], 5);
    final Node nodeC = Node('C', <Node>[], 8);
    final Node nodeD = Node('D', <Node>[], 2);

    final Graph graph = Graph(<Node>[nodeA, nodeB, nodeC, nodeD]);

    test('returns shortest path.', () {
      nodeA.neighbors.addAll(<Node>[nodeB, nodeC]);
      nodeB.neighbors.addAll(<Node>[nodeA, nodeD]);
      nodeC.neighbors.addAll(<Node>[nodeA, nodeD]);
      nodeD.neighbors.addAll(<Node>[nodeB, nodeC]);

      final List<Node>? path = graph.shortestPath(nodeA, nodeD);

      expect(path, equals(<Node>[nodeA, nodeB, nodeD]));
    });

    test('returns null if no path.', () {
      nodeA.neighbors.clear();

      final List<Node>? path = graph.shortestPath(nodeA, nodeD);

      expect(path, isNull);
    });
  });
}
