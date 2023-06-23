// https://leetcode.com/problems/next-greater-element-i/submissions/975294617/

private class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var ans = [Int]()

        for num in nums1 {
            let i = nums2.firstIndex(where: { $0 == num }) ?? 0
            let base = nums2[i]

            for j in i..<nums2.count {
                if nums2[j] > base {
                    ans.append(nums2[j])
                    break
                } else if j == nums2.count - 1 {
                    ans.append(-1)
                }
            }
        }

        return ans
    }
}