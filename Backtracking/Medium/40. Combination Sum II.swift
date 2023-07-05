// https://leetcode.com/problems/combination-sum-ii/submissions/981435243/

private class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]]()
        var subset = [Int]()
        var arr = candidates.sorted()

        func dfs(_ pos: Int, _ sum: Int) {
            if sum == target {
                res.append(subset)
                return
            } else if pos >= arr.count || sum > target { return } 

            var prev = -1
            for i in pos..<arr.count {
                if arr[i] == prev { continue }
                subset.append(arr[i])
                dfs(i+1, sum + arr[i])
                subset.removeLast()
                prev = arr[i]
            }
        }

        dfs(0, 0)
        return res
    }
}