// https://leetcode.com/problems/redundant-connection/submissions/986802979/

private class Solution {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        let len = edges.count
        var parent = [Int]()
        (0...len+1).forEach{ parent.append($0) }
        var rank = [Int](repeating: 1, count: len + 1)

        func find(_ n: Int) -> Int {
            var p = parent[n]
            while p != parent[p] {
                parent[p] = parent[parent[p]]
                p = parent[p]
            }
            return p
        }

        // Return false if not completable
        func union(_ n1: Int, _ n2: Int) -> Bool {
            var p1 = find(n1)
            var p2 = find(n2)

            if p1 == p2 { return false }
            
            if rank[p1] > rank[p2] {
                parent[p2] = p1
                rank[p1] += rank[p2]
            } else {
                parent[p1] = p2
                rank[p2] += rank[p1]
            }

            return true
        }

        for e in edges {
            if !union(e[0], e[1]) { return [e[0], e[1]] }
        }

        return []
    }
}