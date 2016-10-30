from queue import Queue


class Graph(object):
    """A minimal graph using adjacency lists."""

    def __init__(self, nodes=[], edges=[]):
        self.nodes = nodes
        self.adjacency_list = {n: [tail for (head, tail) in edges if head == n] for n in nodes}

    def successors(self, node):
        """Return a list of successors."""
        return self.adjacency_list[node]

    def predecessor(self, node):
        """Return a list of predecessors."""
        # shown for completeness. If this function is called often, this is the wrong data structure.
        return [head for head in self.nodes if node in self.successors(head)]

    def add_node(self, node):
        raise NotImplementedError()

    def add_edge(self, edge):
        raise NotImplementedError()

class spanningTreeNode():
    def __init__(self, val, parent, distance):
        self.val = val
        self.parent = parent
        self.distance = 0

def bfs(graph, start): # returns the spanning tree as a list of tree nodes, each with a parent attribute.  The first node in the list is the root.
    remaining_nodes = Queue()
    visited = set()
    spanningTree = []

    def visit(node, parent, distance):
        print(node)
        visited.add(node)
        spanningTree.append(spanningTreeNode(node, parent, distance))
        for tail in graph.successors(node):
            if tail not in visited:
                remaining_nodes.put((tail, node, distance + 1))


    remaining_nodes.put((start, None, 0))
    while not remaining_nodes.empty():
        n, parent, distance = remaining_nodes.get()
        visit(n, parent, distance)
    return spanningTree

g = Graph(['a', 'b', 'c', 'd', 'e'], [('a', 'b'), ('a', 'c'), ('b', 'd'), ('b', 'e'), ('e', 'a')])
bfs(g, 'a')

# 3. Djikstra's algorithm labels the nodes as:
# a:0
# b:10
# c:5
# d:13
# e:15
# f:17
# g:21