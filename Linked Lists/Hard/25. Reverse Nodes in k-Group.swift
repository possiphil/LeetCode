// https://leetcode.com/problems/reverse-nodes-in-k-group/submissions/977836751/

private class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let dummy = ListNode(0, head)
        var groupPrev = Optional(dummy)

        while let kth = getKth(groupPrev, k) {
            let groupNext = kth.next
            var prev = groupNext
            var cur = groupPrev?.next

            while cur !== groupNext {
                let tmp = cur?.next
                cur?.next = prev
                prev = cur
                cur = tmp
            }

            let tmp = groupPrev?.next
            groupPrev?.next = kth
            groupPrev = tmp
        }

        return dummy.next
    }

    func getKth(_ head: ListNode?, _ k: Int) -> ListNode? {
        var node = head
        var n = k

        while (node != nil) && (n > 0) {
            node = node?.next
            n -= 1
        }

        return node
    } 
}