// https://leetcode.com/problems/clone-graph/submissions/985404013/

private class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        var oldToNew = [Node: Node]()

        func dfs(_ node: Node) -> Node {
            if let clone = oldToNew[node] { return clone }

            let copy = Node(node.val)
            oldToNew[node] = copy
            for neighbor in node.neighbors {
                if let neighbor = neighbor { copy.neighbors.append(dfs(neighbor)) } 
            }

            return copy
        }

        if let node = node { return dfs(node) }
        else { return nil }
    }
}