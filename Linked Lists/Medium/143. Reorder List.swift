// https://leetcode.com/problems/reorder-list/submissions/974049725/

private class Solution {
    func reorderList(_ head: ListNode?) {
        // find middle
        var s = head
        var f = head?.next
        while (f != nil) && (f?.next != nil) {
            s = s?.next
            f = f?.next?.next
        }

        // reverse second half
        var second = s?.next
        var prev: ListNode? = nil 
        s?.next = nil
        while second != nil {
            let temp = second?.next
            second?.next = prev
            prev = second
            second = temp
        }

        // merge two halfs
        var first = head
        second = prev
        while second != nil {
            let temp1 = first?.next
            let temp2 = second?.next
            first?.next = second
            second?.next = temp1
            first = temp1
            second = temp2
        }
    }
}