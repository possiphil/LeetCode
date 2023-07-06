// https://leetcode.com/problems/task-scheduler/submissions/980608305/

private class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var uniqueTasks = [Character: Int]()
        var time = 0
        var maxHeap = MaxHeap()
        var q = [(Int, Int)]()

        tasks.forEach{ uniqueTasks[$0, default: 0] += 1 }
        uniqueTasks.values.forEach{ maxHeap.add($0) }

        while !maxHeap.items.isEmpty || !q.isEmpty {
            time += 1

            if !maxHeap.items.isEmpty {
                let count = (maxHeap.poll() - 1)
                if count != 0 { q.append((count, time + n))}
            }

            if !q.isEmpty && q[0].1 == time {
                maxHeap.add(q.removeFirst().0)
            }
        }

        return time
    }
}

fileprivate struct MaxHeap {
    var items = [Int]()

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

    // Boolean Test
    private func hasLeftChild(_ index: Int) -> Bool {
        return getLeftChildIndex(index) < items.count
    }
    private func hasRightChild(_ index: Int) -> Bool {
        return getRightChildIndex(index) < items.count
    }
    private func hasParent(_ index: Int) -> Bool {
        return getParentIndex(index) >= 0
    }

    // Get Item
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
    mutating public func add(_ item: Int) {
        items.append(item)
        heapifyUp()
    }

    public func peek() -> Int {
        if items.count > 0 {
            return items[0]
        } else {
            fatalError()
        }
    }

    mutating public func poll() -> Int {
        if items.count > 0 {
            let item = items[0]
            items[0] = items[items.count - 1]
            heapifyDown()
            items.removeLast()
            return item
        } else {
            fatalError()
        }
    }

    mutating private func swap(_ indexOne: Int, _ indexTwo: Int) {
        items.swapAt(indexOne, indexTwo)
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
            var largerChildIndex = getLeftChildIndex(index)
            if hasRightChild(index) && rightChild(index) > leftChild(index) {
                largerChildIndex = getRightChildIndex(index)
            }

            if items[index] > items[largerChildIndex] {
                break
            } else {
                swap(index, largerChildIndex)
            }

            index = largerChildIndex
        }
    }
}