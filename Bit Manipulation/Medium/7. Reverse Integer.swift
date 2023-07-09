// https://leetcode.com/problems/reverse-integer/submissions/986943662/

private class Solution {
    let MIN = -2147483648
    let MAX = 2147483647

    func reverse(_ x: Int) -> Int {
        var x = x
        var res = 0

        while (x != 0) {
            let digit = x % 10
            x = x / 10

            let posOutOfBounds = (res > MAX / 10) || (res == MAX / 10 && digit >= MAX % 10)
            let negOutOfBounds = (res < MIN / 10) || (res == MIN / 10 && digit <= MIN % 10)
            if posOutOfBounds || negOutOfBounds { return 0 }

            res = (res * 10) + digit
        }

        return res
    }
}