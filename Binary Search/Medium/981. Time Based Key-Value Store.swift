// https://leetcode.com/problems/time-based-key-value-store/submissions/964354601/

private class TimeMap {
    var map = [String: [(v: String, t: Int)]]()

    init() { }
    
    func set(_ key: String, _ value: String, _ timestamp: Int) {
        map[key, default: []].append((value, timestamp))
    }
    
    func get(_ key: String, _ timestamp: Int) -> String {
        var res = ""
        var values = map[key] ?? []
        var l = 0
        var r = values.count - 1

        while l <= r {
            let m = l + (r - l) / 2

            if values[m].1 == timestamp { 
                res = values[m].0
                break
            } else if values[m].1 < timestamp {
                res = values[m].0
                l = m + 1
            } else { r = m - 1 }
        }

        return res
    }
}