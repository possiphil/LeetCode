// https://leetcode.com/problems/same-tree/submissions/975196831/

private class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if (p == nil) && (q == nil) { return true }
        else if (p == nil) || (q == nil) || (p?.val != q?.val) { return false }
        else { return (isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)) }
    }
}