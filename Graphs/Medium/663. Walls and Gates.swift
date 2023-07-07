// Still no leetcode premium :(

private func wallsAndGates(_ rooms: Array<Array<Int>>) {
    var rooms = rooms
    let rows = rooms.count
    let cols = rooms[0].count
    var visited: Set<String> = []
    var q = [(Int, Int)]()

    func addRoom(_ r: Int, _ c: Int) {
        let rowInbounds = (r >= 0) && (r < rows)
        let colInbounds = (c >= 0) && (c < cols)
        if !rowInbounds || !colInbounds { return }

        if (rooms[r][c] == -1) { return }

        let pos = String(r) + "," + String(c)
        if visited.contains(pos) { return }
        visited.insert(pos)

        q.append((r, c))
    }

    for r in 0..<rows {
        for c in 0..<cols {
            if rooms[r][c] == 0 {
                q.append((r, c))
                let pos = String(r) + "," + String(c)
                visited.insert(pos)
            }
        }
    }

    var dist = 0
    while !q.isEmpty {
        for _ in 0..<q.count {
            let (r, c) = q.removeFirst()
            rooms[r][c] = dist

            addRoom(r + 1, c)
            addRoom(r - 1, c)
            addRoom(r, c + 1)
            addRoom(r, c - 1)
        }
        dist += 1
    }
}