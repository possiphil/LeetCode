// https://leetcode.com/problems/balanced-binary-tree/submissions/975167429/

private class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        func dfs(_ root: TreeNode?) -> (Bool, Int) {
            guard root != nil else { return (true, 0) }

            let left = dfs(root?.left)
            let right = dfs(root?.right)

            let balanced = left.0 && right.0 && (abs(left.1 - right.1) <= 1)

            return (balanced, 1 + max(left.1, right.1))
        }

        return dfs(root).0
    }
}