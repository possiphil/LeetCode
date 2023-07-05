// https://leetcode.com/problems/palindrome-partitioning/submissions/981495116/

private class Solution {
    func partition(_ s: String) -> [[String]] {
        let a = Array(s)
        var res = [[String]]()
        var part = [String]()

        func dfs(_ i: Int) {
            if i >= s.count { res.append(part); return }

            for j in i..<s.count {
                if isPalindrome(Array(a[i..<(j+1)])) { 
                    part.append(String(a[i..<(j+1)])) 
                    dfs(j + 1)
                    part.removeLast()
                }
            }
        }

        dfs(0)
        return res
    }

    func isPalindrome(_ word: [Character]) -> Bool {
        var l = 0
        var r = word.count - 1

        while l <= r {
            if word[l] != word[r] { return false }
            l += 1
            r -= 1
        }

        return true
    }
}