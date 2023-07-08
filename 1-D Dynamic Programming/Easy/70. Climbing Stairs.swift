// Iterative
// https://leetcode.com/problems/climbing-stairs/submissions/983123516/

private class Solution {
    func climbStairs(_ n: Int) -> Int {
        var table = [Int](repeating: 0, count: n + 1)
        table[0] = 1

        for i in 0..<n {
            table[i + 1] += table[i]
            if (i < n - 1) { table[i + 2] += table[i] }
        }

        return table[n]
    }
}

// Iterative II
// https://leetcode.com/problems/climbing-stairs/submissions/983130411/

private class Solution {
    func climbStairs(_ n: Int) -> Int {
        var one = 1
        var two = 1

        for i in 0..<n-1 {
            let temp = one
            one = one + two
            two = temp
        }

        return one
    }
}

// Recursive
// https://leetcode.com/problems/climbing-stairs/submissions/983120832/

private class Solution {
    var memo = [Int: Int]()

    func climbStairs(_ n: Int) -> Int {
        return memoized(n, &memo)
    }

    func memoized(_ n: Int, _ memo: inout [Int: Int]) -> Int {
        if let val = memo[n] { return val }
        else if n == 1 { return 1 }
        else if n == 2 { return 2 }
        memo[n] = memoized(n - 1, &memo) + memoized(n - 2, &memo)
        return memo[n]!
    }
}