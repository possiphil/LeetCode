// https://leetcode.com/problems/course-schedule/submissions/986153325/

private class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var preMap = [Int: [Int]]()
        for pre in prerequisites {
            preMap[pre[0], default: []].append(pre[1])
        }

        var visited: Set<Int> = []
        func dfs(_ course: Int) -> Bool {
            if visited.contains(course) { return false }
            if preMap[course] == nil { return true }
            if preMap[course] == [] { return true }
            visited.insert(course)

            for pre in preMap[course]! {
                if !dfs(pre) { return false }
            }

            visited.remove(course)
            preMap[course] = []

            return true 
        }

        for course in 0..<numCourses {
            if !dfs(course) { return false }
        }

        return true 
    }
}