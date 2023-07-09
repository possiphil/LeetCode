// https://leetcode.com/problems/missing-number/submissions/986929692/

private class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        return nums.count + (0..<nums.count).reduce(0){ $0 + ($1 - nums[$1]) }
    }
}

// https://leetcode.com/problems/missing-number/submissions/986921320/

private class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let target = (0...nums.count).reduce(0, ^)
        let array = nums.reduce(0, ^)
        return target ^ array
    }
}