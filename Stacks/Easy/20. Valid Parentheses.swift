private class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()

        for c in s {
            switch c {
                case "(": stack.append(")")
                case "[": stack.append("]")
                case "{": stack.append("}")
                default: 
                    if stack.isEmpty || stack.removeLast() != c { return false }
            }
        }

        return stack.isEmpty
    }
}