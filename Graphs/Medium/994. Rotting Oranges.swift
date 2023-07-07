// https://leetcode.com/problems/rotting-oranges/submissions/986122545/

private class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var grid = grid
        var q = [(Int, Int)]() // Deque
        var time = 0
        var fresh = 0

        // 1. Look for fresh and rotten oranges
        for r in 0..<grid.count {
            for c in 0..<grid[0].count {
                if grid[r][c] == 1 { fresh += 1 }
                else if grid[r][c] == 2 { q.append((r, c)) }
            }
        }

        // 2. BFS on rotten oranges
        let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        while !q.isEmpty && (fresh > 0) {
            for i in 0..<q.count {
                let (r, c) = q.removeFirst()
                for (dr, dc) in directions {
                    let row = r + dr
                    let col = c + dc
                    if viable(grid, row, col) { 
                        grid[row][col] = 2
                        q.append((row, col))
                        fresh -= 1
                    }
                }
            }

            time += 1
        }

        return fresh == 0 ? time : -1
    }

    func viable(_ grid: [[Int]], _ r: Int, _ c: Int) -> Bool {
        let rowInbounds = (r >= 0) && (r < grid.count)
        let colInbounds = (c >= 0) && (c < grid[0].count)
        if !rowInbounds || !colInbounds { return false }

        return grid[r][c] == 1
    }
}