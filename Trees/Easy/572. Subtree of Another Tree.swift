// https://leetcode.com/problems/subtree-of-another-tree/submissions/975212180/

private class Solution {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if subRoot == nil { return true }
        else if root == nil { return false }
        else if isSameTree(root, subRoot) { return true }
        else { return isSubtree(root?.left, subRoot) || isSubtree(root?.right, subRoot) }
    }

    func isSameTree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if (root == nil) && (subRoot == nil) { return true }
        else if (root == nil) || (root?.val != subRoot?.val) { return false }
        else { return isSameTree(root?.left, subRoot?.left) && isSameTree(root?.right, subRoot?.right) }
    }
}