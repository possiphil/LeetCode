// https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/submissions/964293553/

private class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var res = nums[0]
        var l = 0
        var r = nums.count - 1

        while l <= r {
            guard nums[l] >= nums[r] else { return min(res, nums[l]) }

            let m = l + (r - l) / 2
            res = min(res, nums[m])

            if nums[m] >= nums[l] { l = m + 1 }
            else { r = m - 1 }
        }

        return res
    }
}