// https://leetcode.com/problems/copy-list-with-random-pointer/submissions/977717338/

private class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        var oldToCopy: [Node?: Node?] = [nil: nil]
        var cur = head

        while let node = cur {
            let copy = Node(node.val)
            oldToCopy[node] = copy
            cur = node.next
        }

        cur = head
        while let node = cur {
            let copy = oldToCopy[node]!
            copy?.next = oldToCopy[node.next]!
            copy?.random = oldToCopy[node.random]!
            cur = node.next
        }

        return oldToCopy[head]!
    }
}