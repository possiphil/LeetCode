// https://leetcode.com/problems/coin-change/submissions/983744900/

private class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var table = [Int](repeating: amount + 1, count: amount + 1)
        table[0] = 0

        for i in 1..<amount+1 {
            for c in coins {
                if (i - c >= 0) {
                    table[i] = min(table[i], 1 + table[i - c])
                }
            }
        }

        return table[amount] == amount + 1 ? -1 : table[amount]
    }
}