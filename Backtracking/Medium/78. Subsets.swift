// https://leetcode.com/problems/subsets/submissions/980720078/

private class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var subset = [Int]()
        
        func dfs(_ i: Int) {
            if i >= nums.count { 
                res.append(subset)
                return 
            }

            subset.append(nums[i])
            dfs(i + 1)

            subset.removeLast()
            dfs(i + 1)
        }

        dfs(0)
        return res
    }
}