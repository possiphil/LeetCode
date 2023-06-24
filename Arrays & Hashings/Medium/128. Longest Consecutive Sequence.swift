// https://leetcode.com/problems/longest-consecutive-sequence/submissions/958333036/

private class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let set = Set(nums)
        var streak = 0

        for n in set {
            if !set.contains(n - 1) {
                var length = 0

                while set.contains(n + length) {
                    length += 1
                }

                streak = max(streak, length)
            }
        }

        return streak
    }
}