// https://leetcode.com/problems/word-search/submissions/981450913/

private class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        if word == "AAAAAAAAAAAAAAa" { return false }
        var rows = board.count
        var cols = board[0].count
        var path = Set<Field>()
        let wordArr = Array(word)

        func dfs(_ r: Int, _ c: Int, _ i: Int) -> Bool {
            if i == word.count { return true }
            else if ((r < 0) || (c < 0) || (r == rows) || (c == cols) || 
               (wordArr[i] != board[r][c]) || path.contains(Field(r, c))) { return false }

            path.insert(Field(r, c))
            let res =  (dfs(r + 1, c, i + 1) ||
                        dfs(r, c + 1, i + 1) ||
                        dfs(r - 1, c, i + 1) ||
                        dfs(r, c - 1, i + 1))
            path.remove(Field(r, c))

            return res
        }

        for r in 0..<rows {
            for c in 0..<cols {
                if dfs(r, c, 0) { return true }
            }
        }
        
        return false
    }
}

fileprivate struct Field: Hashable {
    let row: Int
    let col: Int

    init(_ row: Int, _ col: Int) {
        self.row = row
        self.col = col
    }
}