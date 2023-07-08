// https://leetcode.com/problems/palindromic-substrings/submissions/983719036/

private class Solution {
    func countSubstrings(_ s: String) -> Int {
        let arr = Array(s)
        var count = 0

        for i in 0..<arr.count {
            count += palindromesFrom(i, i, arr)
            count += palindromesFrom(i, i + 1, arr)
        }

        return count
    }

    func palindromesFrom(_ l: Int, _ r: Int, _ arr: [Character]) -> Int {
        var count = 0
        var l = l
        var r = r

        while (l >= 0) && (r < arr.count) && (arr[l] == arr[r]) {
            count += 1
            l -= 1
            r += 1
        }

        return count
    }
}