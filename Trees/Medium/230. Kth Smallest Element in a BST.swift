// https://leetcode.com/problems/kth-smallest-element-in-a-bst/submissions/976331760/

private class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var n = 0
        var stack = [TreeNode?]()
        var cur = root

        while (cur != nil) || !stack.isEmpty {
            while cur != nil {
                stack.append(cur)
                cur = cur?.left
            }

            cur = stack.removeLast()
            n += 1

            if n == k { return cur!.val }

            cur = cur?.right
        }

        return 0
    }
}