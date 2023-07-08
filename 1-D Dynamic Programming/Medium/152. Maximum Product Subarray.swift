// https://leetcode.com/problems/maximum-product-subarray/submissions/983775360/

private class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var res = nums.max()!
        var curMin = 1
        var curMax = 1

        for n in nums {
            let temp = n * curMax
            curMax = max(n * curMax, n * curMin, n)
            curMin = min(temp, n * curMin, n)
            res = max(res, curMax)
        }

        return res
    }
}