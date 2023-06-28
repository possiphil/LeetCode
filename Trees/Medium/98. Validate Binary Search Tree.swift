// https://leetcode.com/problems/validate-binary-search-tree/submissions/976306681/

private class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {

        func isValidTree(_ node: TreeNode?, _ left: Int, _ right: Int) -> Bool {
            if node == nil { return true }
            else if (node!.val <= left) || (node!.val >= right) { return false }

            return isValidTree(node?.left, left, node!.val) && isValidTree(node?.right, node!.val, right)
        }

        return isValidTree(root, Int.min, Int.max)
    }
}