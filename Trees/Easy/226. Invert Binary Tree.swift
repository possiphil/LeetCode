// https://leetcode.com/problems/invert-binary-tree/submissions/974113763/

private class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil { return nil }

        let temp = root?.left
        root?.left = root?.right
        root?.right = temp

        invertTree(root?.left)
        invertTree(root?.right)

        return root
    }
}