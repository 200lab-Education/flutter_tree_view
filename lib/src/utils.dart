import 'internal.dart';

/// Callback for interacting with nodes.
typedef TreeViewCallback = void Function(TreeNode node);

/// Callback used to animate the removal of nodes.
typedef RemoveNodeBuilder = Widget Function(
  TreeNode node,
  Animation<double> animation,
);

/// Callback to build a widget for [TreeNode].
typedef NodeBuilder = Widget Function(BuildContext context, TreeNode node);

/// Yields every descendant in the subtree of [node]. In Breadth first traversal.
Iterable<TreeNode> subtreeGenerator(TreeNode node) sync* {
  for (final child in node.children) {
    yield child;
    if (child.hasChildren) yield* subtreeGenerator(child);
  }
}

/// Same as [subtreeGenerator] but with nullable return, useful when
/// filtering nodes to use `orElse: () => null` when no node was found.
Iterable<TreeNode?> nullableSubtreeGenerator(TreeNode node) sync* {
  for (final child in node.children) {
    yield child;
    if (child.hasChildren) yield* subtreeGenerator(child);
  }
}
