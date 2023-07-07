// https://leetcode.com/problems/pacific-atlantic-water-flow/submissions/986062259/

private class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        let rows = heights.count
        let cols = heights[0].count

        var res = [[Int]]()
        var pac: Set<String> = []
        var atl: Set<String> = []

        for c in 0..<cols {
            dfs(heights, heights[0][c], 0, c, &pac)
            dfs(heights, heights[rows - 1][c], rows - 1, c, &atl)
        }

        for r in 0..<rows {
            dfs(heights, heights[r][0], r, 0, &pac)
            dfs(heights, heights[r][cols - 1], r, cols - 1, &atl)
        }

        for a in atl {
            if pac.contains(a) {
                let pos = a.split(separator: ",").map{ Int($0)! }
                res.append(pos)
            }
        }

        return res
    }

    func dfs(_ grid: [[Int]], _ prev: Int, _ r: Int, _ c: Int, _ visited: inout Set<String>) {
        let rowInbounds = (r >= 0) && (r < grid.count)
        let colInbounds = (c >= 0) && (c < grid[0].count)
        if !rowInbounds || !colInbounds { return }

        let curr = grid[r][c]
        if curr < prev { return }

        let pos = String(r) + "," + String(c)
        if visited.contains(pos) { return }
        visited.insert(pos)

        dfs(grid, curr, r + 1, c, &visited)
        dfs(grid, curr, r - 1, c, &visited)
        dfs(grid, curr, r, c + 1, &visited)
        dfs(grid, curr, r, c - 1, &visited)
    }
}