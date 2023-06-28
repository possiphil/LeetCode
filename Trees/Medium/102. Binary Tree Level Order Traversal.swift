// https://leetcode.com/problems/binary-tree-level-order-traversal/submissions/975416583/

private class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var levels = [[Int]]()
        var q = [root]

        while !q.isEmpty {
            var level = [Int]()

            for i in 0..<q.count {
                let node = q.removeFirst()

                if node != nil { 
                    q.append(node!.left) 
                    q.append(node!.right)
                    level.append(node!.val)
                }
            }

            if !level.isEmpty { levels.append(level) }
        }

        return levels
    }
}