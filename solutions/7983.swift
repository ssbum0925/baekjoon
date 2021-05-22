//
//  7983.swift
//  baekjoon
//
//  Created by Nearthlab on 2021/05/22.
//

import Foundation

func sol_7983() {
    let N = Int(readLine() ?? "") ?? 0
    var assignments = [(d: Int, t: Int)].init(repeating: (0, 0), count: N)
    
    for i in 0..<N {
        let input = (readLine() ?? "").components(separatedBy: " ").map { Int($0) ?? 0 }
        assignments[i] = (d: input[0], t: input[1])
    }
    
    assignments.sort { $0.1 > $1.1 }

    var lastDate = assignments[0].1

    for i in 0..<N {
        let (d, t) = assignments[i]
        lastDate = t < lastDate ? t : lastDate
        lastDate -= d
    }
    print(lastDate)
}

func solve1() {
    let N = Int(readLine() ?? "") ?? 0
    var assignments = [(d: Int, t: Int)].init(repeating: (0, 0), count: N)
    
    for i in 0..<N {
        let input = (readLine() ?? "").components(separatedBy: " ").map { Int($0) ?? 0 }
        assignments[i] = (d: input[0], t: input[1])
    }
    
    assignments.sort { $0.1 > $1.1 }

    var lastDate = assignments[0].1

    for i in 0..<N {
        let (d, t) = assignments[i]
        lastDate = t < lastDate ? t : lastDate
        lastDate -= d
    }
    print(lastDate)
}

func solve2() {
    let N = Int(readLine() ?? "") ?? 0
    var assignments = [(d: Int, t: Int)].init(repeating: (0, 0), count: N)
    var lastDate = -1
    
    for i in 0..<N {
        let input = (readLine() ?? "").components(separatedBy: " ").map { Int($0) ?? 0 }
        assignments[i] = (d: input[0], t: input[1])
        lastDate = input[1] > lastDate ? input[1] : lastDate
    }
    
    var result = [Bool].init(repeating: false, count: lastDate + 1)
    for i in 0..<N {
        var (d, t) = assignments[i]
        var count = 0
        while count != d {
            if !result[t] {
                result[t] = true
                count += 1
            }
            t -= 1
        }
    }
    
    var answer = 0
    for i in 1...lastDate {
        if result[i] {
            break
        }
        answer += 1
    }
    
    print(answer)
}

