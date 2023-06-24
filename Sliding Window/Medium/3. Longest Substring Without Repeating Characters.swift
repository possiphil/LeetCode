// https://leetcode.com/problems/longest-substring-without-repeating-characters/submissions/965138191/

private class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var res = 0 
        var l = 0
        var charMap = [Character: Int]()

        for (i, r) in s.enumerated() {
            if let c = charMap[r] { l = max(c + 1, l) }

            res = max(res, i - l + 1)
            charMap[r] = i
        }

        return res
    }
}