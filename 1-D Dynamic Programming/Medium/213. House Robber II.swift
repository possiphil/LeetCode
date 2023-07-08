// https://leetcode.com/problems/house-robber-ii/submissions/983656855/

private class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }
        return max(rob1(Array(nums[1...])), rob1(Array(nums[0...nums.count - 2])))
    }

    func rob1(_ nums: [Int]) -> Int {
        var rob1 = 0
        var rob2 = 0

        for n in nums {
            let temp = max(rob1 + n, rob2)
            rob1 = rob2
            rob2 = temp
        }

        return rob2
    }
}