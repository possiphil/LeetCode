private class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var l = 1
        var r = piles.max()!
        var res = r

        while l <= r {
            let k = l + (r - l) / 2
            var sum = 0

            for pile in piles {
                sum += (pile - 1) / k + 1
            }

            if sum > h { l = k + 1 }
            else { 
                res = min(res, k)
                r = k - 1 
            }
        }

        return res
    }
}