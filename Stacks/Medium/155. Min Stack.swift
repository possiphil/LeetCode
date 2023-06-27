// https://leetcode.com/problems/min-stack/submissions/962120388/

private class MinStack {
    private var stack: [Int]
    private var minStack: [Int]

    init() { 
        stack = []
        minStack = []
    }
    
    func push(_ value: Int) {
        stack.append(value)

        if minStack.isEmpty { minStack.append(value) }
        else {
            let minValue = min(value, minStack.last!)
            minStack.append(minValue)
        }
    }
    
    func pop() {
        stack.removeLast()
        minStack.removeLast()
    }
    
    func top() -> Int {
        return stack.last ?? -1
    }
    
    func getMin() -> Int {
        return minStack.last ?? -1
    }
}