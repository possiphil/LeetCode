// https://leetcode.com/problems/design-add-and-search-words-data-structure/submissions/977885082/

fileprivate final class Node {
    var children = [Character: Node]()
    var endOfWord = false

    init(){}
}

private class WordDictionary {
    let root = Node()

    init(){}
    
    func addWord(_ word: String) {
        var cur = root

        for c in word {
            if cur.children[c] == nil { cur.children[c] = Node() }
            cur = cur.children[c]!
        }

        cur.endOfWord = true
    }
    
    func search(_ word: String) -> Bool {
        func dfs(_ index: Int, _ node: Node) -> Bool {
            var cur = node
            let arr = Array(word)

            for i in index..<word.count {
                let c = arr[i]

                if c == "." { 
                    for child in cur.children.values {
                        if dfs(i + 1, child) { return true }
                    }

                    return false 
                } else {
                    if cur.children[c] == nil { return false }
                    cur = cur.children[c]!
                }
            }

            return cur.endOfWord
        }

        return dfs(0, root)
    }
}