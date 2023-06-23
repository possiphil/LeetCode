// https://leetcode.com/problems/range-sum-query-immutable/submissions/977683775/

private class NumArray {
    private var nums: [Int]

    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        return self.nums[left...right].reduce(0, +)
    }
}