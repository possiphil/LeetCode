// https://leetcode.com/problems/count-good-nodes-in-binary-tree/submissions/976290849/

private class Solution {
    func goodNodes(_ root: TreeNode?) -> Int {
        
        func dfs(_ node: TreeNode?, _ val: Int) -> Int {
            guard node != nil else { return 0 }

            var res = 0
            if node!.val >= val { res = 1 }
            var maxVal = max(val, node!.val)

            res += dfs(node?.left, maxVal)
            res += dfs(node?.right, maxVal)
            return res
        }

        return dfs(root, root!.val)
    }
}