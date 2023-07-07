// https://leetcode.com/problems/course-schedule-ii/submissions/986784708/

private class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var res = [Int]()

        var preMap = [Int: [Int]]()
        (0..<numCourses).forEach{ preMap[$0] = [] }
        for pre in prerequisites {
            preMap[pre[0], default: []].append(pre[1])
        }

        var visited: Set<Int> = []
        var cycle: Set<Int> = []
        func dfs(_ course: Int) -> Bool {
            if cycle.contains(course) { return false }
            if visited.contains(course) { return true }
            cycle.insert(course)

            for pre in preMap[course]! {
                if !dfs(pre) { return false }
            }

            cycle.remove(course)
            visited.insert(course)
            res.append(course)

            return true 
        }

        for c in 0..<numCourses {
            if !dfs(c) { print(c); return [] }
        }

        return res
    }
}