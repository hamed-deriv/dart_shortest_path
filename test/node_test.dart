import 'package:dart_shortest_path/node.dart';
import 'package:test/test.dart';

void main() {
  group('Node test =>', () {
    final Node nodeA = Node('A', <Node>[], 10);
    final Node nodeB = Node('B', <Node>[nodeA], 5);

    test('has correct id.', () {
      expect(nodeA.id, equals('A'));
      expect(nodeB.id, equals('B'));
    });

    test('has correct neighbors.', () {
      expect(nodeA.neighbors, isEmpty);
      expect(nodeB.neighbors, contains(nodeA));
    });

    test('has correct heuristic.', () {
      expect(nodeA.heuristic, equals(10.0));
      expect(nodeB.heuristic, equals(5.0));
    });
  });
}
