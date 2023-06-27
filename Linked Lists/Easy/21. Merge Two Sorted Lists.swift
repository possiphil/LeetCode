// https://leetcode.com/problems/merge-two-sorted-lists/submissions/971855369/

private class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let dummy = ListNode()
        var head = dummy
        var l1 = list1
        var l2 = list2

        while (l1 != nil) && (l2 != nil) {
            if l1?.val ?? 0 < l2?.val ?? 0 { 
                head.next = l1 
                l1 = l1?.next
            } else {
                head.next = l2
                l2 = l2?.next
            }

            head = head.next ?? ListNode()
        }

        if l1 != nil { head.next = l1 }
        else if l2 != nil { head.next = l2 }

        return dummy.next
    }
}