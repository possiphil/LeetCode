// https://leetcode.com/problems/merge-k-sorted-lists/submissions/977798773/

private class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 0 else { return nil }

        var list = lists

        while list.count > 1 {
            var mergedList = [ListNode?]()

            for i in stride(from: 0, to: list.count, by: 2) {
                let node1 = list[i]
                let node2: ListNode? = (i + 1 < list.count) ? list[i + 1] : nil
                mergedList.append(merge2Lists(node1, node2))
            }

            list = mergedList
        }

        return list[0]
    }

    func merge2Lists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode()
        var tail: ListNode? = dummy
        var node1 = l1
        var node2 = l2

        while (node1 != nil) && (node2 != nil) {
            if node1!.val < node2!.val {
                tail?.next = node1
                node1 = node1?.next
            } else {
                tail?.next = node2
                node2 = node2?.next
            }

            tail = tail?.next
        }

        if node1 != nil { tail?.next = node1 }
        if node2 != nil { tail?.next = node2 }

        return dummy.next
    }
}