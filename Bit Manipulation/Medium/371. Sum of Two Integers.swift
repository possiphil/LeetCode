// https://leetcode.com/problems/sum-of-two-integers/submissions/986935785/

private class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b

        while (b != 0) {
            let tmp = (a & b) << 1
            a ^= b
            b = tmp
        }

        return a
    }
}