// https://leetcode.com/problems/top-k-frequent-elements/submissions/958255495/

private class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var freq = [Int: Int]()
        var buckets = Array(repeating: [Int](), count: nums.count + 1)
        var result = [Int]()

        for n in nums { freq[n, default: 0] += 1 }
        for (k, v) in freq { buckets[v].append(k) }
        for i in (0..<buckets.count).reversed() {
            result += buckets[i]
            if result.count == k { break }
        }

        return result
    }
}