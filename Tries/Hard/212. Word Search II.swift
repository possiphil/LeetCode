// https://leetcode.com/problems/word-search-ii/submissions/977925029/

fileprivate final class Node {
    var children = [Character: Node]()
    var endOfWord = false

    init(){}
}

fileprivate final class Trie {
    var root = Node()

    init(){}

    func insert(_ word: String) {
        var cur = root

        for c in word {
            if cur.children[c] == nil { cur.children[c] = Node() }
            cur = cur.children[c]!
        }

        cur.endOfWord = true
    }
}

fileprivate struct Field: Hashable {
    let row: Int
    let col: Int

    init(_ row: Int, _ col: Int) {
        self.row = row
        self.col = col
    }
}

private class Solution {
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        let trie = Trie()

        for word in words {
            trie.insert(word)
        }

        let rows = board.count
        let cols = board[0].count
        var res: Set<String> = []
        var visit: Set<Field> = []

        func dfs(_ r: Int, _ c: Int, _ root: Node, _ w: String) {
            if  (r < 0) || (c < 0) || 
                (r == rows) || (c == cols) || 
                visit.contains(Field(r, c)) || (root.children[board[r][c]] == nil) { return }

            visit.insert(Field(r, c))
            let node = root.children[board[r][c]]!
            let word = w + String(board[r][c])

            if node.endOfWord {
                res.insert(word)
                // could remove word from trie here for optimization
            }

            dfs(r - 1, c, node, word)
            dfs(r + 1, c, node, word)
            dfs(r, c - 1, node, word)
            dfs(r, c + 1, node, word)
            visit.remove(Field(r, c))
        }

        for r in 0..<rows {
            for c in 0..<cols {
                dfs(r, c, trie.root, "")
            }
        }

        return Array(res)
    }
}