// https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/submissions/976355140/

private class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard preorder.count > 0 else { return nil }

        var root = TreeNode(preorder[0])
        var mid = inorder.firstIndex(where: { $0 == root.val})!

        root.left = buildTree(Array(preorder[1..<(mid+1)]), Array(inorder[0..<mid]))
        root.right = buildTree(Array(preorder[(mid+1)...]), Array(inorder[(mid+1)...]))

        return root
    }
}