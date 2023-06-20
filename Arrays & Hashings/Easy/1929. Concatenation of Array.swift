private class Solution {
    func getConcatenation(_ nums: [Int]) -> [Int] {
        var ans = [Int]()
        ans = nums + nums
        return ans
    }
}