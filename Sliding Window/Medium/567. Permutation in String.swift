// https://leetcode.com/problems/permutation-in-string/submissions/970961966/

private class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let s1 = Array(s1.unicodeScalars)
        let s2 = Array(s2.unicodeScalars)
        var s1arr = Array(repeating: 0, count: 26)
        var s2arr = Array(repeating: 0, count: 26)
    
        for c in s1 { s1arr[Int(c.value - 97)] += 1 }
    
        for i in 0..<s2.count {
            if i >= s1.count { s2arr[Int(s2[i - s1.count].value - 97)] -= 1 }
            s2arr[Int(s2[i].value - 97)] += 1
            if s1arr == s2arr { return true }
        }
    
        return false
    }
}