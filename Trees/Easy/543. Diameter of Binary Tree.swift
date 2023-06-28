// https://leetcode.com/problems/diameter-of-binary-tree/submissions/975150441/

private class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var res = 0

        func dfs(_ root: TreeNode?) -> Int {
            guard root != nil else { return -1 }

            var left = dfs(root?.left) ?? -1
            var right = dfs(root?.right) ?? -1

            res = max(res, 2 + left + right)

            return 1 + max(left, right)
        }

        dfs(root)
        return res
    }
}