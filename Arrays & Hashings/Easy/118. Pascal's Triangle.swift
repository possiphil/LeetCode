// https://leetcode.com/problems/pascals-triangle/submissions/975225635/

private class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 1 else { return [[1]] }
        var rows = [[1]]

        for i in 0..<numRows - 1 {
            var tmp = [1]

            for j in 0..<rows[i].count {
                if j < rows[i].count - 1 { 
                    tmp.append(rows[i][j] + rows[i][j+1])
                }
            }

            tmp.append(1)
            rows.append(tmp)
        }

        return rows
    }
}