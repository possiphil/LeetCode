// https://leetcode.com/problems/lru-cache/submissions/977785776/

private final class Node {
    var key: Int
    var val: Int
    var prev: Node?
    var next: Node?

    init(_ key: Int = 0, _ val: Int = 0, _ prev: Node? = nil, _ next: Node? = nil) {
        self.key = key
        self.val = val
        self.prev = prev
        self.next = next
    }
}

private class LRUCache {
    let cap: Int
    var cache: [Int: Node]
    let lru: Node
    let mru: Node

    init(_ capacity: Int) {
        self.cap = capacity
        self.cache = [:]
        self.lru = Node()
        self.mru = Node()
        self.lru.next = mru
        self.mru.prev = lru
    }
    
    func get(_ key: Int) -> Int {
        if let node = self.cache[key] { 
            remove(node)
            insert(node)
            return node.val
        }
        else { return -1 }
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = self.cache[key] { remove(node) }

        self.cache[key] = Node(key, value)
        insert(self.cache[key]!)

        if self.cache.count > cap { 
            let lru = self.lru.next!
            remove(lru)
            self.cache[lru.key] = nil
        }
    }

    func remove(_ node: Node) {
        let prev = node.prev
        let next = node.next

        prev?.next = next
        next?.prev = prev
    }

    func insert(_ node: Node) {
        let prev = self.mru.prev!
        let next = self.mru

        prev.next = node
        next.prev = node
        node.next = next
        node.prev = prev
    }
}