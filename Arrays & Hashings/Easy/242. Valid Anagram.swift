// one-liner
// https://leetcode.com/problems/valid-anagram/submissions/958149295/

private class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        return s.unicodeScalars.sorted() == t.unicodeScalars.sorted()
    }
}


// improved time complexity
// https://leetcode.com/problems/valid-anagram/submissions/958149681/

private class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }

        var dict = [Character: Int]()

        for char in s {
            dict[char, default: 0] += 1
        }

        for char in t {
            if let count = dict[char], count > 0 {
                dict[char] = count - 1
            } else {
                return false
            }
        }

        return true
    }
}