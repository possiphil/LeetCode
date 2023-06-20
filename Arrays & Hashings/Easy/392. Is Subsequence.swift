private class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var sArr = [Character]()
        for i in (0..<s.count).reversed() { sArr.append(s[s.index(s.startIndex, offsetBy: i)])}

        for c in t {
            guard !sArr.isEmpty else { break }

            if c == sArr.last! { sArr.removeLast() }
        }

        return sArr.isEmpty
    }
}