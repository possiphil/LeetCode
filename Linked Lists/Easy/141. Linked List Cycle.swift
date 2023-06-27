// https://leetcode.com/problems/linked-list-cycle/submissions/975325631/

private class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var fast = head
        var slow = head

        while (fast != nil) && (fast?.next != nil) {
            slow = slow?.next
            fast = fast?.next?.next

            if slow === fast { return true }
        }

        return false
    }
}