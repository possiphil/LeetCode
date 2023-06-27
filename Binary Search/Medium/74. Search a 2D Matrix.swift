// https://leetcode.com/problems/search-a-2d-matrix/submissions/964274607/

private class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count
        let n = matrix[0].count

        var l = 0
        var r = m * n - 1

        while l <= r {
            let mid = l + (r - l) / 2
            let el = matrix[mid / n][mid % n]

            if el < target { l = mid + 1 } 
            else if el > target { r = mid - 1 }
            else { return true }
        }

        return false
    }
}