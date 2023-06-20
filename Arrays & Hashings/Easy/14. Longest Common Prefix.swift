private class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var ans = ""
        let short = strs.sorted{ $0.count < $1.count }[0]

        guard short != "" else { return "" }

        for i in 1...short.count {
            if Set(strs.map{ $0.prefix(i) }).count == 1 {
                ans = String(strs[0].prefix(i))
            } else { break }
        }

        return ans
    }
}