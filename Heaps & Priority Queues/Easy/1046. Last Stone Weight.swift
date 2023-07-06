// https://leetcode.com/problems/last-stone-weight/submissions/978711510/

private class Solution {
    var maxHeap = MaxHeap()

    func lastStoneWeight(_ stones: [Int]) -> Int {
        stones.forEach{ maxHeap.add($0) }

        while maxHeap.size > 1 {
            let heaviest = maxHeap.poll()
            let secondHeaviest = maxHeap.poll()

            if heaviest > secondHeaviest {
                maxHeap.add(heaviest - secondHeaviest)
            }
        }

        return maxHeap.size == 0 ? 0 : maxHeap.peek()
    }
}

// Basic Max Heap
fileprivate struct MaxHeap {
    var items: [Int]

    init(_ items: [Int] = []) {
        self.items = items
    }

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
        return items[getLeftChildIndex(index)]
    }
    private func rightChild(_ index: Int) -> Int {
        return items[getRightChildIndex(index)]
    }
    private func parent(_ index: Int) -> Int {
        return items[getParentIndex(index)]
    }

    // Heap Operations
    mutating private func swap(_ indexOne: Int, _ indexTwo: Int) {
        let placeholder = items[indexOne]
        items[indexOne] = items[indexTwo]
        items[indexTwo] = placeholder
    } 

    public func peek() -> Int {
        if items.count != 0 {
            return items[0]
        } else {
            fatalError()
        }
    }

    mutating public func poll() -> Int {
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

    mutating public func add(_ item: Int) {
        items.append(item)
        heapifyUp()
    }

    mutating private func heapifyUp() {
        var index = items.count - 1
        while hasParent(index) && parent(index) < items[index] {
            swap(getParentIndex(index), index)
            index = getParentIndex(index)
        }
    }

    mutating private func heapifyDown() {
        var index = 0
        while hasLeftChild(index) {
            var biggerChildIndex = getLeftChildIndex(index)
            if hasRightChild(index) && rightChild(index) > leftChild(index) {
                biggerChildIndex = getRightChildIndex(index)
            }

            if items[index] > items[biggerChildIndex] {
                break
            } else {
                swap(index, biggerChildIndex)
            }

            index = biggerChildIndex
        }
    }
}

// Extension for problem
fileprivate extension MaxHeap {
    var size: Int { items.count }
}