// https://leetcode.com/problems/combination-sum/submissions/980756521/

private class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]]()

        func dfs(_ i: Int, _ cur: [Int], _ total: Int) {
            if total == target { 
                res.append(cur) 
                return
            }

            if i >= candidates.count || total > target { return }

            dfs(i + 1, cur, total)
            var new = cur
            new.append(candidates[i])
            dfs(i, new, total + candidates[i])
        }

        dfs(0, [], 0)
        return res
    }
}