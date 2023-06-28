// Iterative DFS
// https://leetcode.com/problems/maximum-depth-of-binary-tree/submissions/975130282/

private class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        var stack = [(root, 1)]
        var res = 0

        while !stack.isEmpty {
            let (node, depth) = stack.removeLast()

            if node != nil {
                res = max(res, depth)
                stack.append((node?.left, depth + 1))
                stack.append((node?.right, depth + 1))
            }
        }

        return res
    }
}

// Recursive DFS
// https://leetcode.com/problems/maximum-depth-of-binary-tree/submissions/975124374/

private class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }

        return 1 + max(maxDepth(root?.left), maxDepth(root?.right))
    }
}

// BFS
// https://leetcode.com/problems/maximum-depth-of-binary-tree/submissions/975127870/

private class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }

        var level = 0
        var q = [root]

        while !q.isEmpty {
            for i in 0..<q.count {
                let node = q.removeFirst()
                if node?.left != nil { q.append(node?.left) }
                if node?.right != nil { q.append(node?.right) }
            }

            level += 1
        }

        return level
    }
}