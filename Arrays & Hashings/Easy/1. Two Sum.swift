private class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()

        for (i, n) in nums.enumerated() {
            if let val = dict[target-n] { return [val, i] }
            else { dict[n] = i }
        }

        return []
    }
}