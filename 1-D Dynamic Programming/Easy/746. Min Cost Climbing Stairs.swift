// https://leetcode.com/problems/min-cost-climbing-stairs/submissions/983627402/

private class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var table = cost + [0]

        for i in stride(from: cost.count - 3, through: 0, by: -1) {
            table[i] += min(table[i + 1], table[i + 2])
        }

        return min(table[0], table[1])
    }
}