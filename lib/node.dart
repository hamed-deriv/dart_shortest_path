class Node {
  Node(this.id, this.neighbors, this.heuristic);

  String id;
  List<Node> neighbors;
  double heuristic;
}
