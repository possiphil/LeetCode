// https://leetcode.com/problems/k-closest-points-to-origin/submissions/980473776/

private class Solution {
    var minHeap = MinHeap()

    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        for point in points {
            let distance = Int((pow(Double(point[0]), 2) + pow(Double(point[1]), 2)) * 100)
            minHeap.add([distance, point[0], point[1]])
        }

        var res = [[Int]]()
        for _ in 0..<k {
            let temp = minHeap.poll()
            res.append([temp[1], temp[2]])
        }

        return res
    } 
}

// Basic MinHeap
fileprivate struct MinHeap {
    var items = [[Int]]()

    // Get Index
    private func getLeftChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 1
    }
    private func getRightChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 2
    }
    private func getParentIndex(_ childIndex: Int) -> Int {
        return (childIndex - 1) / 2
    }

    // Boolean Check
    private func hasLeftChild(_ index: Int) -> Bool {
        return getLeftChildIndex(index) < items.count
    }
    private func hasRightChild(_ index: Int) -> Bool {
        return getRightChildIndex(index) < items.count
    }
    private func hasParent(_ index: Int) -> Bool {
        return getParentIndex(index) >= 0
    }

    // Return Item From Heap
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
    mutating private func swap(indexOne: Int, indexTwo: Int) {
        let placeholder = items[indexOne]
        items[indexOne] = items[indexTwo]
        items[indexTwo] = placeholder
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
            items[0] = items[items.count - 1]
            heapifyDown()
            items.removeLast()
            return item
        } else {
            fatalError()
        }
    }

    mutating public func add(_ item: [Int]) {
        items.append(item)
        heapifyUp()
    }

    mutating private func heapifyUp() {
        var index = items.count - 1
        while hasParent(index) && parent(index) > items[index][0] {
            swap(indexOne: getParentIndex(index), indexTwo: index)
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
                swap(indexOne: index, indexTwo: smallerChildIndex)
            }

            index = smallerChildIndex
        }
    }
}