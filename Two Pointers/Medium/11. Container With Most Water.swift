private class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var l = 0
        var r = height.count - 1
        var ans = 0

        while l < r {
            ans = max(min(height[l], height[r]) * (r - l), ans)

            if height[l] < height[r] { l += 1 } 
            else { r -= 1 }
        }
        
        return ans
    }
}