// Iterative
// https://leetcode.com/problems/word-break/submissions/983779710/

fileprivate extension String {
    func range(from start: Int, to end: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: start)
        let endIndex = self.index(self.startIndex, offsetBy: end)
        let range = startIndex..<endIndex
        return String(self[range])
    }
}

private class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let sLen = s.count
        var table = [Bool](repeating: false, count: sLen + 1)
        table[0] = true

        for i in 0..<sLen {
            if table[i] {
                for word in wordDict {
                    let wordLen = word.count
                    if (i + wordLen <= sLen) && (s.range(from: i, to: i + word.count) == word) {
                        table[i + word.count] = true
                    }
                }
            }
        }

        return table[sLen]
    }
}

// Reverse Iterative
// https://leetcode.com/problems/word-break/submissions/983785942/

private class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let sLen = s.count
        var dp = [Bool](repeating: false, count: sLen + 1)
        dp[sLen] = true

        for i in stride(from: sLen - 1, through: 0, by: -1) {
            for w in wordDict {
                let wLen = w.count
                if (i + wLen <= sLen) && (s.range(from: i, to: i + wLen) == w) {
                    dp[i] = dp[i + wLen]
                    if dp[i] { break }
                }
            }
        }

        return dp[0]
    }
}