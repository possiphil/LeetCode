// https://leetcode.com/problems/longest-increasing-subsequence/submissions/983795840/

private class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        let len = nums.count
        var dp = [Int](repeating: 1, count: len)

        for i in stride(from: len - 1, through: 0, by: -1) {
            for j in i+1..<len {
                if nums[i] < nums[j] { dp[i] = max(dp[i], 1 + dp[j]) }
            }
        }

        return dp.max()!
    }
}