// https://leetcode.com/problems/majority-element/submissions/975256939/

private class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var counts = [Int: Int]()

        for num in nums {
            counts[num, default: 0] += 1
        }

        return counts.values.max.key 
    }
}