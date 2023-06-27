// https://leetcode.com/problems/find-the-duplicate-number/submissions/977762298/

private class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var s = 0
        var f = 0

        repeat {
            s = nums[s]
            f = nums[nums[f]]
        } while s != f

        var s2 = 0

        while s != s2 {
            s = nums[s]
            s2 = nums[s2]
        }

        return s
    }
}