// https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/submissions/976364510/

private class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if (p!.val < root!.val) && (q!.val < root!.val) { return lowestCommonAncestor(root?.left, p, q) }
        else if (p!.val > root!.val) && (q!.val > root!.val) { return lowestCommonAncestor(root?.right, p, q) }
        else { return root }
    }
}