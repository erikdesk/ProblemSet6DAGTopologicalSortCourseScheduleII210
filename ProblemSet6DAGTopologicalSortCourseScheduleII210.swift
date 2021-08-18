import Foundation

func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    
    var adj = [[Int]](repeating: [], count: numCourses)
    var inDegrees = [Int](repeating: 0, count: numCourses)
    
    for edge in prerequisites {
//        print(edge)
        adj[edge[1]].append(edge[0])
        inDegrees[edge[0]] += 1
    }
    
//    for i in 0..<adj.count {
//        print(i, inDegrees[i], adj[i])
//    }
    
    var q = [Int]()
    for u in 0..<inDegrees.count {
        if inDegrees[u] == 0 {
            q.append(u)
        }
    }
    
    var order = [Int]()
    
    while q.count != 0 {
        let u = q[0]
        q.removeFirst()
        order.append(u)
        for v in adj[u] {
            inDegrees[v] -= 1
            if inDegrees[v] == 0 {
                q.append(v)
            }
        }
    }
    
    for inDegree in inDegrees {
        if inDegree != 0 {
            return []
        }
    }
    
    return order
}
