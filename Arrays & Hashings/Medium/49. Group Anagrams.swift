// https://leetcode.com/problems/group-anagrams/submissions/959860747/

private class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var anagramDictionary = [[Int]: [String]]()

        for string in strs {
            var counts = Array(repeating: 0, count: 26)

            for character in string {
                let index = Int(character.asciiValue! - 97)
                counts[index] += 1
            }

            anagramDictionary[counts, default: []].append(string)
        }

        return Array(anagramDictionary.values)
    }
}