// https://leetcode.com/problems/serialize-and-deserialize-binary-tree/submissions/976424728/

private class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var res = [String]()

        func dfs(_ node: TreeNode?) {
            guard let node = node else { 
                res.append("N")
                return 
            }

            res.append(String(node.val))
            dfs(node.left)
            dfs(node.right)
        }

        dfs(root)
        return res.joined(separator: ",")
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var q = data.components(separatedBy: ",")

        func dfs(_ q: inout [String]) -> TreeNode? {
            let val = q.removeFirst()
            if val == "N" { return nil }

            let node = TreeNode(Int(val) ?? 0)
            node.left = dfs(&q)
            node.right = dfs(&q)

            return node
        }

        return dfs(&q)
    }
}