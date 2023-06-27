// https://leetcode.com/problems/add-two-numbers/submissions/977026483/

private class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var list1 = l1
        var list2 = l2
        var carry = 0

        let dummy = ListNode()
        var head: ListNode? = dummy

        while list1 != nil || list2 != nil || carry != 0 {
            let val1 = list1?.val ?? 0
            let val2 = list2?.val ?? 0
            var sum = val1 + val2 + carry

            carry = sum / 10
            sum = sum % 10

            head?.next = ListNode(sum)
            head = head?.next
            list1 = list1?.next
            list2 = list2?.next
        }

        return dummy.next
    }
}