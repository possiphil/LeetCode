private class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        guard nums1.count <= nums2.count else { return findMedianSortedArrays(nums2, nums1) }

        var l = 0
        var r = nums1.count
        
        while l <= r {
            let i = l + (r - l) / 2
            let j = (nums1.count + nums2.count + 1) / 2 - i
            
            let lA = i == 0 ? Int.min : nums1[i - 1]
            let rA = i == nums1.count ? Int.max : nums1[i]
            
            let lB = j == 0 ? Int.min : nums2[j - 1]
            let rB = j == nums2.count ? Int.max : nums2[j]
            
            if lA <= rB && lB <= rA {
                if ((nums1.count + nums2.count) % 2 == 0) { return Double(max(lA, lB) + min(rA, rB)) / 2 } 
                else { return Double(max(lA, lB)) }
            } else if lA > rB { r = i - 1 } 
            else { l = i + 1 }
        }
        
        return 0.0
    }
}