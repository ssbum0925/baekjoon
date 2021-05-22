//
//  1003.swift
//  baekjoon
//
//  Created by Nearthlab on 2021/05/05.
//

import Foundation

func sol_1003() {
    let N = Int(readLine() ?? "") ?? 0
    var results = [String]()
    
    for _ in 0..<N {
        let N = Int(readLine() ?? "" ) ?? 0
        results.append(solve(N: N))
    }
    
    for result in results {
        print(result)
    }
}

func solve(N: Int) -> String {
    if N == 0 {
        return "1 0"
    }
    var list = [(count0: Int, count1: Int)](repeating: (count0: 0, count1: 0), count: N + 1)
    list[0] = (count0: 1, count1: 0)
    list[1] = (count0: 0, count1: 1)
    
    for i in 0...N {
        if i == 0 || i == 1 {
            continue
        }
        list[i] = (count0: list[i - 1].count0 + list[i - 2].count0, count1: list[i - 1].count1 + list[i - 2].count1)
    }
    return "\(list[N].count0) \(list[N].count1)"
}
