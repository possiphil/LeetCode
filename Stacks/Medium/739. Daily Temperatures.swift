private class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var ans = Array(repeating: 0, count: temperatures.count)
        var stack = [Int]()

        for i in 0..<temperatures.count {
            while !stack.isEmpty && temperatures[stack.last!] < temperatures[i] {
                let j = stack.removeLast()
                ans[j] = i - j
            }

            stack.append(i)
        }

        return ans
    }
}