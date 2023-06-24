// https://leetcode.com/problems/minimum-window-substring/submissions/971055676/

private class Solution {
    func minWindow(_ str: String, _ t: String) -> String {
        let s = Array(str)
        guard s.count >= t.count else { return "" }

        var window = [Character: Int]()
        var dict = [Character: Int]()
        for c in t { dict[c, default: 0] += 1 }

        var res: (Int, Int) = (-1, -1)
        var resLen = Int.max
        var have = 0
        var need = dict.count

        var l = 0
        for r in 0..<s.count {
            let c = s[r]
            window[c, default: 0] += 1

            if (dict[c] != nil) && (window[c] == dict[c]) { have += 1 }

            while have == need {
                if (r - l + 1) < resLen { 
                    res = (l, r)
                    resLen = r - l + 1
                }

                let lC = s[l]
                window[lC, default: 0] -= 1
                if (dict[lC] != nil) && (window[lC, default: 0] < dict[lC, default: 0]) { have -= 1 }
                l += 1
            }
        }

        var r = 0
        (l, r) = res

        return resLen == Int.max ? "" : String(s[l...r])
    }
}