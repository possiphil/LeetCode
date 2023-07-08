// https://leetcode.com/problems/partition-equal-subset-sum/submissions/983804824/

private class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let sum = nums.reduce(0, +)
        let len = nums.count
        if sum % 2 != 0 { return false }

        var dp: Set<Int> = []
        dp.insert(0)
        let target = sum / 2

        for i in stride(from: len - 1, through: 0, by: -1) {
            var temp = dp
            for t in dp {
                let tSum = t + nums[i]
                if (tSum == target) { return true }
                temp.insert(tSum)
            }
            dp = temp
        }

        return false
    }
}