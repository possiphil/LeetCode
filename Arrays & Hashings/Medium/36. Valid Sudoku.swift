// https://leetcode.com/problems/valid-sudoku/submissions/960740028/

private class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows: [Int: Set<Character>] = [:]
        var columns: [Int: Set<Character>] = [:]
        var squares: [[Int]: Set<Character>] = [:]

        for (row, characters) in board.enumerated() {
            for (col, char) in characters.enumerated() {
                if char == "." { continue }
                else if rows[row]?.contains(char) == true ||
                   columns[col]?.contains(char) == true ||
                   squares[[row/3, col/3]]?.contains(char) == true { return false }
                else {
                    rows[row, default: Set<Character>()].insert(char)
                    columns[col, default: Set<Character>()].insert(char)
                    squares[[row/3, col/3], default: Set<Character>()].insert(char)
                }
            }
        }

        return true
    }
}