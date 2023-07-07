// https://leetcode.com/problems/surrounded-regions/submissions/986091344/

private class Solution {
    func solve(_ board: inout [[Character]]) {
        let rows = board.count
        let cols = board[0].count

        // 1. (DFS) Capture unsurrounded regions (O -> T)
        for r in 0..<rows {
            for c in 0..<cols { 
                if (board[r][c] == "O") && isBorder(board, r, c) { capture(&board, r, c) }
            }
        }

        // 2. Capture surrounded regions (O -> X)
        for r in 0..<rows {
            for c in 0..<cols { 
                if board[r][c] == "O" { board[r][c] = "X" }
            }
        }

        // 3. Uncapture unsurrounded regions (T -> O)
        for r in 0..<rows {
            for c in 0..<cols { 
                if board[r][c] == "T" { board[r][c] = "O" }
            }
        }
    }

    func isBorder(_ board: [[Character]], _ r: Int, _ c: Int) -> Bool {
        let rowBorder = (r == 0) || (r == board.count - 1)
        let colBorder = (c == 0) || (c == board[0].count - 1)
        return rowBorder || colBorder
    }

    func capture(_ board: inout [[Character]], _ r: Int, _ c: Int) {
        let rowInbounds = (r >= 0) && (r < board.count)
        let colInbounds = (c >= 0) && (c < board[0].count)
        if !rowInbounds || !colInbounds { return }

        if board[r][c] != "O" { return }

        board[r][c] = "T"

        capture(&board, r + 1, c)
        capture(&board, r - 1, c)
        capture(&board, r, c + 1)
        capture(&board, r, c - 1)
    }
}