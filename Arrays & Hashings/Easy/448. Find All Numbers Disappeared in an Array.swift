// https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/submissions/977938517/

private class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var res = [Int]()
        var set = Set(nums)

        for num in 1...nums.count {
            if !set.contains(num) { res.append(num) }
        }

        return res
    }
}