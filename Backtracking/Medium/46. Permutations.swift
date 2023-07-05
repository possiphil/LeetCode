// https://leetcode.com/problems/permutations/submissions/981389384/

private class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        
        func dfs(_ arr: [Int], _ pos: [Int]) {
            if arr.count == nums.count {
                res.append(arr)
                return
            } else {
                for i in 0..<pos.count {
                    var newArr = arr
                    newArr.append(pos[i])
                    var newPos = pos
                    newPos.remove(at: i)
                    dfs(newArr, newPos)
                }
            }
        }

        dfs([], nums)
        return res
    }
}