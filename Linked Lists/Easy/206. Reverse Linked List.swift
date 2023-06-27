// Iterative
// https://leetcode.com/problems/reverse-linked-list/submissions/971837691/

private class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode?
        var curr = head

        while curr != nil {
            let nxt = curr?.next
            curr?.next = prev
            prev = curr
            curr = nxt
        }

        return prev
    }
}

// Recursive
// https://leetcode.com/problems/reverse-linked-list/submissions/971841372/

private class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }

        var newHead = head
        if head?.next != nil { 
            newHead = self.reverseList(head?.next) 
            head?.next?.next = head
        }
        head?.next = nil

        return newHead
    }
}