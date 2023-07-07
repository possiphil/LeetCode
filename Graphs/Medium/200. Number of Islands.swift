// DFS
// https://leetcode.com/problems/number-of-islands/submissions/985352333/

private class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var count = 0
        var visited: Set<String> = []

        for r in 0..<grid.count {
            for c in 0..<grid[0].count {
                if explore(grid, r, c, &visited) { count += 1 }
            }
        }

        return count
    }

    func explore(_ grid: [[Character]], _ r: Int, _ c: Int, _ visited: inout Set<String>) -> Bool {
        let rowInbounds = (r >= 0) && (r < grid.count)
        let colInbounds = (c >= 0) && (c < grid[0].count)
        if !rowInbounds || !colInbounds { return false }

        if (grid[r][c] == "0") { return false }

        let pos = String(r) + "," + String(c)
        if visited.contains(pos) { return false }
        visited.insert(pos)

        explore(grid, r + 1, c, &visited)
        explore(grid, r - 1, c, &visited)
        explore(grid, r, c + 1, &visited)
        explore(grid, r, c - 1, &visited)

        return true 
    }
}

// BFS
// https://leetcode.com/problems/number-of-islands/submissions/985368317/

private class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var count = 0
        var visited: Set<String> = []

        for r in 0..<grid.count {
            for c in 0..<grid[0].count {
                if explore(grid, r, c, &visited) { count += 1 }
            }
        }

        return count
    }

    func explore(_ grid: [[Character]], _ r: Int, _ c: Int, _ visited: inout Set<String>) -> Bool {
        if !isInbounds(grid, r, c) { return false }

        if !isLand(grid, r, c) { return false }

        let pos = String(r) + "," + String(c)
        if !hasNotBeenVisited(grid, pos, &visited) { return false }
        visited.insert(pos)

        var queue = [(r, c)]
        let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

        while !queue.isEmpty {
            let (r, c) = queue.removeFirst()
            for (dr, dc) in directions {
                let r = r + dr
                let c = c + dc
                let pos = String(r) + "," + String(c)
                if isInbounds(grid, r, c) && isLand(grid, r, c) && hasNotBeenVisited(grid, pos, &visited) {
                    queue.append((r, c))
                    visited.insert(pos)
                }
            }
        }

        return true 
    }

    func isInbounds(_ grid: [[Character]], _ r: Int, _ c: Int) -> Bool {
        let rowInbounds = (r >= 0) && (r < grid.count)
        let colInbounds = (c >= 0) && (c < grid[0].count)
        return rowInbounds && colInbounds
    }

    func isLand(_ grid: [[Character]], _ r: Int, _ c: Int) -> Bool {
        return grid[r][c] == "1"
    }

    func hasNotBeenVisited(_ grid: [[Character]], _ pos: String, _ visited: inout Set<String>) -> Bool {
        return !visited.contains(pos)
    }
}