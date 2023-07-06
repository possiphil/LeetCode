// https://leetcode.com/problems/find-median-from-data-stream/submissions/980694131/

private class MedianFinder {
    var leftPartition = MaxHeap()
    var rightPartition = MinHeap()

    init(){}
    
    func addNum(_ num: Int) {
        leftPartition.add(num)

        if (leftPartition.size > 0 && rightPartition.size > 0) &&
           leftPartition.peek() > rightPartition.peek() {

            rightPartition.add(leftPartition.poll())
        }

        if leftPartition.size > rightPartition.size + 1 {
            rightPartition.add(leftPartition.poll())
        }
        if rightPartition.size > leftPartition.size + 1 {
            leftPartition.add(rightPartition.poll())
        }
    }
    
    func findMedian() -> Double {
        if leftPartition.size > rightPartition.size {
            return leftPartition.max()
        } else if rightPartition.size > leftPartition.size {
            return rightPartition.min()
        } else {
            return (leftPartition.max() + rightPartition.min()) / 2
        }
    }
}

fileprivate struct MinHeap {
    var items = [Int]()
    var size: Int { items.count }

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
    private func hasLeftChild(_ parentIndex: Int) -> Bool {
        return getLeftChildIndex(parentIndex) < items.count
    }
    private func hasRightChild(_ parentIndex: Int) -> Bool {
        return getRightChildIndex(parentIndex) < items.count
    }
    private func hasParent(_ childIndex: Int) -> Bool {
        return getParentIndex(childIndex) >= 0
    }

    // Get Item
    private func leftChild(_ parentIndex: Int) -> Int {
        return items[getLeftChildIndex(parentIndex)]
    }
    private func rightChild(_ parentIndex: Int) -> Int {
        return items[getRightChildIndex(parentIndex)]
    }
    private func parent(_ childIndex: Int) -> Int {
        return items[getParentIndex(childIndex)]
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
            fatalError("Can't peek at Min Heap.")
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
            fatalError("Can't poll from Min Heap.")
        }
    }

    mutating private func swap(_ indexOne: Int, _ indexTwo: Int) {
        let placeholder = items[indexOne]
        items[indexOne] = items[indexTwo]
        items[indexTwo] = placeholder
    }

    mutating private func heapifyUp() {
        var index = items.count - 1
        while hasParent(index) && parent(index) > items[index] {
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

            if items[index] < items[smallerChildIndex] {
                break 
            } else {
                swap(index, smallerChildIndex)
            }

            index = smallerChildIndex
        }
    }
}

fileprivate extension MinHeap {
    public func min() -> Double {
        if items.count > 0 {
            return Double(items[0])
        } else {
            fatalError("Can't find min of MinHeap")
        }
    }
}

fileprivate struct MaxHeap {
    var items = [Int]()
    var size: Int { items.count }

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
    private func hasLeftChild(_ parentIndex: Int) -> Bool {
        return getLeftChildIndex(parentIndex) < items.count
    }
    private func hasRightChild(_ parentIndex: Int) -> Bool {
        return getRightChildIndex(parentIndex) < items.count
    }
    private func hasParent(_ childIndex: Int) -> Bool {
        return getParentIndex(childIndex) >= 0
    }

    // Get Item
    private func leftChild(_ parentIndex: Int) -> Int {
        return items[getLeftChildIndex(parentIndex)]
    }
    private func rightChild(_ parentIndex: Int) -> Int {
        return items[getRightChildIndex(parentIndex)]
    }
    private func parent(_ childIndex: Int) -> Int {
        return items[getParentIndex(childIndex)]
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
            fatalError("Can't peek at Max Heap.")
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
            fatalError("Can't poll from Max Heap.")
        }
    }

    mutating private func swap(_ indexOne: Int, _ indexTwo: Int) {
        let placeholder = items[indexOne]
        items[indexOne] = items[indexTwo]
        items[indexTwo] = placeholder
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

fileprivate extension MaxHeap {
    public func max() -> Double {
        if items.count > 0 {
            return Double(items[0])
        } else {
            fatalError("Can't find max of Max Heap.")
        }
    }
}