// Easy & Fast Solution
// https://leetcode.com/problems/number-of-1-bits/submissions/986890144/

private class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var n = n
        var res = 0
        while n > 0 {
            res += n % 2
            n >>= 1
        }
        return res
    }
}

// Neat & Faster Solution
// https://leetcode.com/problems/number-of-1-bits/submissions/986893166/

private class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var n = n
        var res = 0
        while n > 0 {
            n &= (n - 1)
            res += 1
        }
        return res
    }
}