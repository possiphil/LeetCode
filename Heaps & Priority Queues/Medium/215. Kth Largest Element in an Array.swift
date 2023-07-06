// https://leetcode.com/problems/kth-largest-element-in-an-array/submissions/980507482/

private class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var arr = nums
        let index = nums.count - k

        func quickSelect(_ l: Int, _ r: Int) -> Int {
            let pivot = arr[r]
            var p = l

            for i in l..<r {
                if arr[i] <= pivot {
                    arr.swapAt(p, i)
                    p += 1
                }
            }

            arr.swapAt(p, r)

            if p > index { return quickSelect(l, p - 1) }
            else if p < index { return quickSelect(p + 1, r) }
            else { return arr[p] }
        }

        return quickSelect(0, arr.count - 1)
    }
}