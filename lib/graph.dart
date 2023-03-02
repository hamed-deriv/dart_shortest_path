import 'node.dart';

class Graph {
  Graph(this.nodes);

  final List<Node> nodes;

  List<Node>? shortestPath(Node start, Node goal) {
    final Set<Node> openSet = <Node>{};
    final Set<Node> closedSet = <Node>{};

    final Map<Node, double> gScore = <Node, double>{};
    gScore[start] = 0.0;

    final Map<Node, double> fScore = <Node, double>{};
    fScore[start] = start.heuristic;

    final Map<Node, Node> cameFrom = <Node, Node>{};

    openSet.add(start);

    while (openSet.isNotEmpty) {
      Node current =
          openSet.reduce((Node a, Node b) => fScore[a]! < fScore[b]! ? a : b);

      if (current == goal) {
        final List<Node> path = <Node>[current];

        while (cameFrom.containsKey(current)) {
          current = cameFrom[current]!;
          path.insert(0, current);
        }

        return path;
      }

      openSet.remove(current);
      closedSet.add(current);

      for (final Node neighbor in current.neighbors) {
        if (closedSet.contains(neighbor)) {
          continue;
        }

        final double tentativeGScore = gScore[current]! + 1.0;

        if (!openSet.contains(neighbor)) {
          openSet.add(neighbor);
        } else if (tentativeGScore >= gScore[neighbor]!) {
          continue;
        }

        cameFrom[neighbor] = current;
        gScore[neighbor] = tentativeGScore;
        fScore[neighbor] = gScore[neighbor]! + neighbor.heuristic;
      }
    }

    return null;
  }
}
