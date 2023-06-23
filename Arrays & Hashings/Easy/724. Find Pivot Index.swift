// https://leetcode.com/problems/find-pivot-index/submissions/975308599/

private class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums[1...].reduce(0, +)

        if left == right { return 0 }

        for i in 1..<nums.count {
            left += nums[i - 1]
            right -= nums[i]
            if left == right { return i }
        }

        return -1
    }
}