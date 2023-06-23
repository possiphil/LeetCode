// https://leetcode.com/problems/remove-element/submissions/961570873/

private class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        nums = nums.filter{ $0 != val }
        return nums.count
    }
}