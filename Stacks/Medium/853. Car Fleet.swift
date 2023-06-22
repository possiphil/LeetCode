private class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        var stack = [Double]()

        for (p, s) in zip(position, speed).sorted(by: >) {
            stack.append(Double(target - p) / Double(s))

            if (stack.count >= 2) && (stack[stack.count - 1] <= stack[stack.count - 2]) {
                stack.popLast()
            }
        }

        return stack.count
    }
}