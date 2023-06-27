// https://leetcode.com/problems/largest-rectangle-in-histogram/submissions/964230035/

private class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var maxArea = 0
        var stack = [(i: Int, h: Int)]()

        for (i, h) in heights.enumerated() {
            var start = i

            while !stack.isEmpty && (stack.last!.1 > h) {
                let (index, height) = stack.popLast()!
                maxArea = max(maxArea, height * (i - index))
                start = index
            }

            stack.append((start, h))
        }

        for (i, h) in stack {
            maxArea = max(maxArea, h * (heights.count - i))
        }

        return maxArea
    }
}