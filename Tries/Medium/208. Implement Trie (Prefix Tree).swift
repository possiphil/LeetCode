// https://leetcode.com/problems/implement-trie-prefix-tree/submissions/977869055/

fileprivate final class Node {
    var children = [Character: Node]()
    var endOfWord = false

    init() { }
}

private class Trie {
    var root = Node()

    init() { }
    
    func insert(_ word: String) {
        var cur = self.root

        for c in word {
            if cur.children[c] == nil { cur.children[c] = Node() }
            cur = cur.children[c]!
        }

        cur.endOfWord = true
    }
    
    func search(_ word: String) -> Bool {
        var cur = self.root

        for c in word {
            if cur.children[c] == nil { return false }
            cur = cur.children[c]!
        }

        return cur.endOfWord
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var cur = self.root

        for c in prefix {
            if cur.children[c] == nil { return false }
            cur = cur.children[c]!
        }

        return true
    }
}