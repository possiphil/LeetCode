// https://leetcode.com/problems/max-area-of-island/submissions/986036693/

private class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var maximum = 0
        var visited: Set<String> = []

        for r in 0..<grid.count {
            for c in 0..<grid[0].count {
                let size = exploreSize(grid, r, c, &visited)
                if (size > 0) { maximum = max(maximum, size) }
            }
        }

        return maximum
    }

    func exploreSize(_ grid: [[Int]], _ r: Int, _ c: Int, _ visited: inout Set<String>) -> Int {
        let rowInbounds = (r >= 0) && (r < grid.count)
        let colInbounds = (c >= 0) && (c < grid[0].count)
        if !rowInbounds || !colInbounds { return 0 }

        if (grid[r][c] == 0) { return 0 }

        let pos = String(r) + "," + String(c)
        if visited.contains(pos) { return 0 }
        visited.insert(pos)

        var size = 1
        size += exploreSize(grid, r + 1, c, &visited)
        size += exploreSize(grid, r - 1, c, &visited)
        size += exploreSize(grid, r, c + 1, &visited)
        size += exploreSize(grid, r, c - 1, &visited)

        return size
    }
}