# Shortest Path Algorithm using A\* Algorithm

This code defines two classes, Node and Graph, to implement the A\* algorithm for finding the shortest path between two nodes in a graph.

## Node Class

The Node class represents a node in the graph. It has three properties:

- id: A unique identifier for the node.
- neighbors: A list of Node objects representing the neighbors of the node.
- heuristic: A heuristic value for the node used by the A\* algorithm.

## Graph Class

The Graph class represents the graph. It has one property:

- nodes: A list of Node objects representing the nodes in the graph.

It also has one method:

- shortestPath(start, goal): Takes in two Node objects representing the start and goal nodes and returns the shortest path between them using the A\* algorithm.

## Usage

To use the code, create a Graph object and set its nodes property to a list of Node objects representing the nodes in the graph. Then, call the shortestPath method on the Graph object, passing in the start and goal Node objects as arguments.

The code also includes an example of how to print the graph as a matrix and how to print the shortest path between two nodes if one exists.
