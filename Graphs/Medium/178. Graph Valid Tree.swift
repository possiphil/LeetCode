// LC Premium

private func validTree(_ n: Int, _ edges: Array<Array<Int>>) -> Bool {
    var visited: Set<Int> = []
    var adj = [Int: [Int]]()
    (0..<n).forEach{ adj[$0] = [] }
    for e in edges {
        adj[e[0]]!.append(e[1])
        adj[e[1]]!.append(e[0])
    }

    func dfs(_ i: Int, _ prev: Int) -> Bool {
        if visited.contains(i) { return false }
        visited.insert(i)

        for j in adj[i]! {
            if j == prev { continue }
            if !dfs(j, i) { return false }
        }

        return true
    }

    return dfs(0, -1) && (visited.count == n)
}