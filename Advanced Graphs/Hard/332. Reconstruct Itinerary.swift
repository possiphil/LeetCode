// https://leetcode.com/problems/reconstruct-itinerary/submissions/987697681/

private class Solution {
    func findItinerary(_ tickets: [[String]]) -> [String] {
        var res = ["JFK"]
        var tickets = tickets.sorted{ $0[1] < $1[1] }

        var adj = [String: [String]]()
        tickets.forEach{ adj[$0[0]] = [] }
        for t in tickets {
            adj[t[0], default: []].append(t[1])
        }

        func dfs(_ source: String) -> Bool {
            if res.count == tickets.count + 1 { return true }
            if adj[source] == nil { return false }

            let temp = adj[source]!
            for (i, v) in temp.enumerated() {
                adj[source]!.remove(at: i)
                res.append(v)

                if dfs(v) { return true }

                adj[source]!.insert(v, at: i)
                res.removeLast()
            }

            return false 
        }

        dfs("JFK")
        return res
    }
}