// Iterative
// https://leetcode.com/problems/decode-ways/submissions/983735009/

private class Solution {
    func numDecodings(_ s: String) -> Int {
        let len = s.count
        let arr = Array(s)
        var dp = [len: 1]

        for i in stride(from: len - 1, through: 0, by: -1) {
            if arr[i] == "0" { dp[i] = 0 }
            else { dp[i] = dp[i + 1] }

            if inBounds(i + 1, len) && upTo26(i, arr) {
                dp[i]! += dp[i + 2]!
            }
        }

        return dp[0]!
    }

    func inBounds(_ i: Int, _ len: Int) -> Bool {
        return i < len
    }

    func upTo26(_ i: Int, _ arr: [Character]) -> Bool {
        return arr[i] == "1" || (arr[i] == "2" && !["7", "8", "9"].contains(arr[i+1]))
    }
}

// Recursive
// https://leetcode.com/problems/decode-ways/submissions/983731032/

private class Solution {
    func numDecodings(_ s: String) -> Int {
        let len = s.count
        let arr = Array(s)
        var dp = [len: 1]

        func dfs(_ i: Int) -> Int {
            if let ways = dp[i] { return ways }
            if arr[i] == "0" { return 0 }
            var res = 0

            res = dfs(i + 1)
            if (i + 1 < len) && (arr[i] == "1" || (arr[i] == "2" && !["7", "8", "9"].contains(arr[i+1]))) {
                res += dfs(i + 2)
            }

            dp[i] = res
            return res
        }

        return dfs(0)
    }
}