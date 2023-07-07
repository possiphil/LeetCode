// https://leetcode.com/problems/word-ladder/submissions/986875350/

fileprivate extension String {
    func range(_ start: Int, _ end: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: start)
        let endIndex = self.index(self.startIndex, offsetBy: end)
        let range = startIndex..<endIndex
        return String(self[range])
    }
}

private class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        if !wordList.contains(endWord) { return 0 }

        var adj = [String: [String]]()
        var wordList = wordList
        wordList.append(beginWord)

        for word in wordList {
            for j in 0..<word.count {
                let pattern = word.range(0, j) + "*" + word.range(j+1, word.count)
                adj[pattern, default: []].append(word)
            }
        }

        var visited: Set<String> = [beginWord]
        var q = [beginWord]
        var res = 1
        while !q.isEmpty {
            for i in 0..<q.count {
                let word = q.removeFirst()
                if word == endWord { return res }
                for j in 0..<word.count {
                    let pattern = word.range(0, j) + "*" + word.range(j+1, word.count)
                    for nei in adj[pattern]! {
                        if !visited.contains(nei) {
                            visited.insert(nei)
                            q.append(nei)
                        }
                    }
                }
            }

            res += 1
        }

        return 0
    }
}