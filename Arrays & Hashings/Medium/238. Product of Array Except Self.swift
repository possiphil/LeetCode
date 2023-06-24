// https://leetcode.com/problems/product-of-array-except-self/submissions/960707015/

private class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var l = 0
        var m = 1
        var r = 2
        var ans = [Int]()

            while l <= m {
                while m < r {
                    while r < nums.count - 1 {
                        ans.append(nums[l] * nums[m] * nums[r])
                        r += 1
                    }
                    ans.append(nums[l] * nums[m] * nums[r])
                    m += 1
                }
                ans.append(nums[l] * nums[m] * nums[r])
                l += 1
            }

        return ans.reversed()
    }
}