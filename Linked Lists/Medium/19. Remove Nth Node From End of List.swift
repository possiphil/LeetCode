// https://leetcode.com/problems/remove-nth-node-from-end-of-list/submissions/977691405/

private class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy: ListNode? = ListNode(0, head)
        var l = dummy
        var r = head

        for _ in 0..<n { r = r?.next }

        while r != nil {
            l = l?.next
            r = r?.next
        }

        l?.next = l?.next?.next

        return dummy?.next
    }
}