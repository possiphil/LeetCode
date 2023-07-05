// https://leetcode.com/problems/n-queens/submissions/981519643/

private class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var col = Set<Int>()
        var posDiag = Set<Int>()
        var negDiag = Set<Int>()

        var res = [[String]]()
        var board = [[String]](repeating: [String](repeating: ".", count: n), count: n)

        func dfs(_ r: Int) {
            if r == n { res.append(boardToOutput(board)); return }

            for c in 0..<n {
                if col.contains(c) || posDiag.contains(r + c) || negDiag.contains(r - c) { continue }
                col.insert(c)
                posDiag.insert(r + c)
                negDiag.insert(r - c)
                board[r][c] = "Q"

                dfs(r + 1)

                col.remove(c)
                posDiag.remove(r + c)
                negDiag.remove(r - c)
                board[r][c] = "."
            }
        }

        dfs(0)
        return res
    }

    func boardToOutput(_ board: [[String]]) -> [String] {
        var output = [String]()
        for row in board { output.append(row.joined()) }
        return output
    }
}