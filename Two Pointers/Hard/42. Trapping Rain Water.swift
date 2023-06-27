// https://leetcode.com/problems/trapping-rain-water/submissions/961500822/

private class Solution {
    func trap(_ height: [Int]) -> Int {
        var sum = 0
        var l = 0
        var r = height.count - 1
        var lMax = height[l]
        var rMax = height[r]

        while l < r {
            if lMax < rMax {
                l += 1
                lMax = max(lMax, height[l])
                sum += lMax - height[l]
            } else {
                r -= 1
                rMax = max(rMax, height[r])
                sum += rMax - height[r]
            }
        }

        return sum
    }
}