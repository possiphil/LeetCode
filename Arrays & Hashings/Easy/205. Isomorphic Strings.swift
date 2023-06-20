private class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var replacements = [Character: Character]()
        var replaced = [Character: Character]()

        let sArr = Array(s)
        let tArr = Array(t)

        for i in 0..<t.count {
            if (replacements[sArr[i]] != nil && replacements[sArr[i]] != tArr[i]) ||
               (replaced[tArr[i]] != nil && replaced[tArr[i]] != sArr[i]) { return false }
            
            replacements[sArr[i]] = tArr[i]
            replaced[tArr[i]] = sArr[i]
        }

        return true
    }
}