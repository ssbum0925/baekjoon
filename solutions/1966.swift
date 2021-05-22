//
//  1966.swift
//  baekjoon
//
//  Created by Nearthlab on 2021/04/09.
//

import Foundation

func sol_1966() {
    let N = Int(readLine() ?? "") ?? 0
    var results = [Int]()
    for _ in 0..<N {
        let line1 = readLine() ?? ""
        let line1Array = line1.components(separatedBy: " ")
        let N = Int(line1Array[0]) ?? 0
        let M = Int(line1Array[1]) ?? 0
        
        if N < 1 || 100 < N {
            continue
        }
        
        if M < 0 || N <= M {
            continue
        }
        
        let line2 = (readLine() ?? "").replacingOccurrences(of: " ", with: "")
        results.append(solve(docs: line2, targetIndex: M))
    }
    results.forEach { result in
        print(result)
    }
}

func solve(docs: String, targetIndex: Int) -> Int {
    let queue = Queue(queueSize: 200)
    for (idx, doc) in docs.enumerated() {
        let priority = Int("\(doc)") ?? 0
        let queueElement: [String: Any] = [
            "priority": priority,
            "target": idx == targetIndex
        ]
        queue.enqueue(element: queueElement)
    }
    
    func checkPriority(front: [String: Any]) -> Bool {
        let queueCopy = queue.copy()
        let priority = front["priority"] as? Int ?? 0
        var result = true
        while !queueCopy.isEmpty() {
            let currentFront = queueCopy.dequeue()
            let currentPriority = currentFront["priority"] as? Int ?? 0
            result = result && (priority >= currentPriority)
        }
        
        return result
    }
    
    var count = 0
    while !queue.isEmpty() {
        let front = queue.dequeue()
        
        if checkPriority(front: front) {
            count += 1
            let target = front["target"] as? Bool ?? false
            if target {
                break
            }
        } else {
            queue.enqueue(element: front)
        }
    }
    return count
}
