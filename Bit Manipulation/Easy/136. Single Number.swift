// https://leetcode.com/problems/single-number/description/

private class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        return nums.reduce(0, ^)
    }
}