import 'package:dart_shortest_path/graph.dart';
import 'package:dart_shortest_path/node.dart';

void main() {
  final Node a = Node('A', <Node>[], 7);
  final Node b = Node('B', <Node>[], 6);
  final Node c = Node('C', <Node>[], 2);
  final Node d = Node('D', <Node>[], 1);
  final Node e = Node('E', <Node>[], 0);
  final Node f = Node('F', <Node>[], 2);
  final Node g = Node('G', <Node>[], 1);
  final Node h = Node('H', <Node>[], 0);

  a.neighbors = <Node>[b, c];
  b.neighbors = <Node>[a, d];
  c.neighbors = <Node>[a, d];
  d.neighbors = <Node>[b, c, e];
  e.neighbors = <Node>[d, f, g];
  f.neighbors = <Node>[e, h];
  g.neighbors = <Node>[e, h];
  h.neighbors = <Node>[f, g];

  final Graph graph = Graph(<Node>[a, b, c, d, e, f, g, h]);

  print('Graph:');
  final List<List<String>> matrix = List<List<String>>.generate(
    graph.nodes.length,
    (_) => List<String>.generate(graph.nodes.length, (_) => ' '),
  );

  for (int i = 0; i < graph.nodes.length; i++) {
    final Node node = graph.nodes[i];

    for (int j = 0; j < node.neighbors.length; j++) {
      final Node neighbor = node.neighbors[j];
      final int index = graph.nodes.indexOf(neighbor);

      matrix[i][index] = '1';
    }
  }

  print("    ${graph.nodes.map((Node node) => node.id).join(" ")}");
  for (int i = 0; i < graph.nodes.length; i++) {
    final Node node = graph.nodes[i];
    print("${node.id}  |${matrix[i].join(" ")}|");
  }

  final List<Node>? path = graph.shortestPath(a, h);

  if (path != null) {
    print('\nShortest path found:');

    for (final Node node in path) {
      print('- ${node.id}');
    }
  } else {
    print('\nNo path found.');
  }
}
