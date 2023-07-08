// https://leetcode.com/problems/longest-palindromic-substring/submissions/983669886/

private class Solution {
    func longestPalindrome(_ s: String) -> String {
        let len = s.count
        let arr = Array(s)
        var l = 0
        var r = 0
        var table = [[Bool]](repeating: [Bool](repeating: false, count: len), count: len)

        guard len > 1 else { return s }

        for i in 1..<len {
            for j in 0..<i where (arr[j] == arr[i]) && ((table[j+1][i-1]) || (i - j <= 2)) {
                table[j][i] = true
                if i - j > r - l {
                    l = j
                    r = i
                }
            }
        }

        return String(arr[l...r])
    }
}