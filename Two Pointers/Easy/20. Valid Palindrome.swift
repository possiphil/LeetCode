// https://leetcode.com/problems/valid-palindrome/submissions/958179107/

private class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var l = s.startIndex
        var r = s.index(before: s.endIndex)

        while l < r {
            if !(s[l].isLetter || s[l].isNumber) { 
                l = s.index(after: l) 
                continue
                }
            if !(s[r].isLetter || s[r].isNumber) { 
                r = s.index(before: r) 
                continue
                }

            if s[l].lowercased() == s[r].lowercased() {
                l = s.index(after: l)
                r = s.index(before: r)
            } else { return false }
        }

        return true
    }
}