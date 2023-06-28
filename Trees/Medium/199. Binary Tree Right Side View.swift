// https://leetcode.com/problems/binary-tree-right-side-view/submissions/976271010/

private class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [] }

        var q = [root] // deque
        var rightVals = [Int]()

        while !q.isEmpty {
            rightVals.append(q.last!!.val)
            
            for i in 0..<q.count {
                let node = q.removeFirst()
                if node!.left != nil { q.append(node!.left) }
                if node!.right != nil { q.append(node!.right) }
            }
        }

        return rightVals
    }
}