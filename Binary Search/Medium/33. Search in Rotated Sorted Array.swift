// https://leetcode.com/problems/search-in-rotated-sorted-array/submissions/964312448/

private class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0
        var r = nums.count - 1

        while l <= r {
            let m = l + (r - l) / 2

            if target == nums[m] { return m }
            else if nums[l] <= nums[m] && (target > nums[m] || target < nums[l]) ||
                    nums[l] > nums[m] && !(target < nums[m] || target > nums[r]) { l = m + 1}
            else { r = m - 1}
        }

        return -1
    }
}