private class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var stack = [String]()
        var ans = [String]()

        func backtrack(_ openC: Int, _ closedC: Int) {
            if openC == closedC, openC == n, closedC == n {
                ans.append(stack.joined())
                return
            } 
            
            if openC < n {
                stack.append("(")
                backtrack(openC + 1, closedC)
                stack.popLast()
            } 
            
            if closedC < openC {
                stack.append(")")
                backtrack(openC, closedC + 1)
                stack.popLast()
            }
        }

        backtrack(0, 0)
        return ans
    }
}