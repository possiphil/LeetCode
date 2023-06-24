// https://leetcode.com/problems/longest-repeating-character-replacement/submissions/970990977/

private class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        let strArr = Array(s)
        var count = [Character: Int]()
        var res = 0

        var l = 0
        var maxF = 0
        for r in 0..<s.count {
            count[strArr[r], default: 0] += 1
            maxF = max(maxF, count[strArr[r]] ?? 0)

            while (r - l + 1) - maxF > k {
                count[strArr[l], default: 0] -= 1
                l += 1
            }

            res = max(res, r - l + 1)
        }

        return res
    }
}