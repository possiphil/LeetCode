// https://leetcode.com/problems/contains-duplicate/submissions/958139669/

private class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return nums.count == Set(nums).count ? false : true
    }
}