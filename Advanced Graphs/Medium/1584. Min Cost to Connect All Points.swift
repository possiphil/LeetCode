// https://leetcode.com/problems/min-cost-to-connect-all-points/submissions/987734395/

private class Solution {
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        let n = points.count
        if n == 1 { return 0 }

        // 1. Compute Edges
        var adj = [Int: [[Int]]]()

        for i in 0..<n {
            let x1 = points[i][0]
            let y1 = points[i][1]
            for j in (i+1)..<n {
                let x2 = points[j][0]
                let y2 = points[j][1]
                let dist = abs(x1 - x2) + abs(y1 - y2)
                adj[i, default: []].append([dist, j])
                adj[j, default: []].append([dist, i])
            }
        }

        // Prim's Algorithm
        var res = 0
        var visited: Set<Int> = []
        var minHeap = MinHeap([[0, 0]])

        while visited.count < n {
            let item = minHeap.poll()
            let cost = item[0]
            let i = item[1]

            if visited.contains(i) { continue }

            res += cost
            visited.insert(i)
            
            for nei in adj[i]! {
                let neiC = nei[0]
                let neiV = nei[1]

                if !visited.contains(neiV) { minHeap.add([neiC, neiV]) }
            }
        }

        return res 
    }
}

fileprivate struct MinHeap {
    var items: [[Int]]
    var size: Int { items.count }

    init(_ items: [[Int]] = []) {
        self.items = items
    }

    // Get Index
    private func getLeftChildIndex(_ index: Int) -> Int {
        return 2 * index + 1
    }
    private func getRightChildIndex(_ index: Int) -> Int {
        return 2 * index + 2
    }
    private func getParentIndex(_ index: Int) -> Int {
        return (index - 1) / 2
    }

    // Boolean Test
    private func hasLeftChild(_ index: Int) -> Bool {
        return getLeftChildIndex(index) < size
    }
    private func hasRightChild(_ index: Int) -> Bool {
        return getRightChildIndex(index) < size
    }
    private func hasParent(_ index: Int) -> Bool {
        return getParentIndex(index) >= 0
    }

    // Get Item
    private func leftChild(_ index: Int) -> Int {
        return items[getLeftChildIndex(index)][0]
    }
    private func rightChild(_ index: Int) -> Int {
        return items[getRightChildIndex(index)][0]
    }
    private func parent(_ index: Int) -> Int {
        return items[getParentIndex(index)][0]
    }

    // Heap Operations
    mutating public func add(_ item: [Int]) {
        items.append(item)
        heapifyUp()
    }

    public func peek() -> [Int] {
        if items.count != 0 {
            return items[0]
        } else {
            fatalError()
        }
    }

    mutating public func poll() -> [Int] {
        if items.count != 0 {
            let item = items[0]
            items[0] = items[size - 1]
            heapifyDown()
            items.removeLast()
            return item
        } else {
            fatalError()
        }
    }
    
    mutating private func swap(_ indexOne: Int, _ indexTwo: Int) {
        let placeholder = items[indexOne]
        items[indexOne] = items[indexTwo]
        items[indexTwo] = placeholder
    }

    mutating private func heapifyUp() {
        var index = size - 1
        while hasParent(index) && parent(index) > items[index][0] {
            swap(getParentIndex(index), index)
            index = getParentIndex(index)
        }
    }

    mutating private func heapifyDown() {
        var index = 0
        while hasLeftChild(index) {
            var smallerChildIndex = getLeftChildIndex(index)
            if hasRightChild(index) && rightChild(index) < leftChild(index) {
                smallerChildIndex = getRightChildIndex(index)
            }

            if items[index][0] < items[smallerChildIndex][0] {
                break
            } else {
                swap(index, smallerChildIndex)
            }

            index = smallerChildIndex
        }
    }
}