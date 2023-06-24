// https://leetcode.com/problems/sliding-window-maximum/submissions/971076459/

private class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var q: [Int] = [] // Deque
        var res: [Int] = []

        var l = 0
        for r in 0..<nums.count {
            while !q.isEmpty && nums[q.last!] < nums[r] { q.removeLast() }

            q.append(r)

            if l > q[0] { q.removeFirst() }

            if (r + 1) >= k {
                res.append(nums[q[0]])
                l += 1
            }
        }

        return res
    }
}