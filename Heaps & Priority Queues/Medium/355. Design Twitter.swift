// https://leetcode.com/problems/design-twitter/submissions/980548952/

private class Twitter {
    var followings = [Int: Set<Int>]() 
    var tweets = [Int: [(Int, Int)]]()
    var time = 0
    

    init(){}
    
    func postTweet(_ userId: Int, _ tweetId: Int) {
        tweets[userId, default: []].append((time, tweetId))
        time += 1
    }
    
    func getNewsFeed(_ userId: Int) -> [Int] {
        var res = [Int]()
        var maxHeap = MaxHeap()

        followings[userId, default: []].insert(userId)
        guard let followeeIds = followings[userId] else { return [] }
        for followeeId in followeeIds {
            if let followeeTweets = tweets[followeeId] {
                let index = followeeTweets.count - 1
                let tweet = followeeTweets[index]
                maxHeap.add([tweet.0, tweet.1, followeeId, index - 1])
            }
        }

        while maxHeap.size > 0 && res.count < 10 {
            let item = maxHeap.poll()
            res.append(item[1])

            if item[3] >= 0 {
                let tweet = tweets[item[2]]![item[3]]
                maxHeap.add([tweet.0, tweet.1, item[2], item[3] - 1])
            }
        }

        return res
    }
    
    func follow(_ followerId: Int, _ followeeId: Int) {
        followings[followerId, default: []].insert(followeeId)
    }
    
    func unfollow(_ followerId: Int, _ followeeId: Int) {
        if followings[followerId] != nil && followings[followerId]!.contains(followeeId) {
            followings[followerId]!.remove(followeeId)
        }
    }
}

fileprivate struct MaxHeap {
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

    // Get Item Recency
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
        if items.count > 0 {
            return items[0]
        } else {
            fatalError()
        }
    }

    mutating public func poll() -> [Int] {
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
        let placeholder = items[indexOne]
        items[indexOne] = items[indexTwo]
        items[indexTwo] = placeholder
    }

    mutating private func heapifyUp() {
        var index = items.count - 1
        while hasParent(index) && parent(index) < items[index][0] {
            swap(getParentIndex(index), index)
            index = getParentIndex(index)
        }
    }

    mutating private func heapifyDown() {
        var index = 0
        while hasLeftChild(index) {
            var smallerChildIndex = getLeftChildIndex(index)
            if hasRightChild(index) && rightChild(index) > leftChild(index) {
                smallerChildIndex = getRightChildIndex(index)
            }

            if items[index][0] > items[smallerChildIndex][0] {
                break
            } else {
                swap(index, smallerChildIndex)
            }

            index = smallerChildIndex
        }
    }
}

fileprivate extension MaxHeap {
    var size: Int { items.count }
}