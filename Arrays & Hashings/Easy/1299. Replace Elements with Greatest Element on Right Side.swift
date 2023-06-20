private class Solution {
    func replaceElements(_ arr: [Int]) -> [Int] {
        var ans = [-1]

        for i in (0..<arr.count).reversed() {
            if arr[i] > ans.last! { ans.append(arr[i]) }
            else { ans.append(ans.last!) }
        }

        return ans.dropLast().reversed()
    }
}