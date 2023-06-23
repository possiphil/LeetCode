// https://leetcode.com/problems/concatenation-of-array/submissions/974052103/

private class Solution {
    func getConcatenation(_ nums: [Int]) -> [Int] {
        var ans = [Int]()
        ans = nums + nums
        return ans
    }
}