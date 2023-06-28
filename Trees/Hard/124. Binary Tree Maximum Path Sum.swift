// https://leetcode.com/problems/binary-tree-maximum-path-sum/submissions/976380267/

private class Solution {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var res = root!.val

        func dfs(_ root: TreeNode?) -> Int {
            guard root != nil else { return 0 }

            var leftMax = max(dfs(root?.left), 0)
            var rightMax = max(dfs(root?.right), 0)

            res = max(res, root!.val + leftMax + rightMax)

            return root!.val + max(leftMax, rightMax)
        }

        dfs(root)
        return res
    }
}