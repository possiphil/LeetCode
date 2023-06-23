// https://leetcode.com/problems/length-of-last-word/submissions/975221666/

private class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        return s.split(separator: " ").last?.count ?? 0
    }
}