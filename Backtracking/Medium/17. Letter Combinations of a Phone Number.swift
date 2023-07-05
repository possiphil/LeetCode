// https://leetcode.com/problems/letter-combinations-of-a-phone-number/submissions/981509326/

private class Solution {
    let keyboard: [Character: [Character]] = [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"]
    ]

    func letterCombinations(_ digits: String) -> [String] {
        var res = [String]()
        var comb = [Character]()
        let a = Array(digits)

        func dfs(_ i: Int) {
            if i == a.count { res.append(String(comb)); return }

            for c in keyboard[a[i]]! {
                comb.append(c)
                dfs(i+1)
                comb.removeLast()
            }
        }

        if digits.count > 0 { dfs(0) }
        return res
    }
}