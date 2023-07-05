// https://leetcode.com/problems/subsets-ii/submissions/981419730/

private class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var subset = [Int]()
        let arr = nums.sorted()

        func dfs(_ index: Int) {
            if index == arr.count { 
                res.append(subset)
                return 
            }

            subset.append(arr[index])
            dfs(index+1)
            subset.removeLast()

            var i = index
            while (i + 1 < arr.count) && (arr[i] == arr[i+1]) { i += 1 }
            dfs(i+1)
        }

        dfs(0)
        return res 
    }
}