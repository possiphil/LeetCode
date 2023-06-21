private class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sorted = nums.sorted()
        var ans = [[Int]]()

        for (i, n) in sorted.enumerated() {
            if i > 0 && n == sorted[i - 1] { continue }

            var l = i + 1
            var r = nums.count - 1

            while l < r {
                let sum = n + sorted[l] + sorted[r]

                if sum > 0 {
                    r -= 1
                } else if sum < 0 {
                    l += 1
                } else {
                    ans.append([n, sorted[l], sorted[r]])
                    l += 1

                    while sorted[l] == sorted[l - 1] && l < r {
                        l += 1
                    }
                }
            }
        }

        return ans
    }
}