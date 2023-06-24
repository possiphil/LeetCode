// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/submissions/965112729/

private class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }

        var low = prices[0]
        var res = 0

        for i in 1..<prices.count {
            let curr = prices[i]

            if curr <= low { low = curr } 
            else { res = max(res, curr - low) }
        }

        return res
    }
}