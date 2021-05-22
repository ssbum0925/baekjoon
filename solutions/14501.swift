//
//  14501.swift
//  baekjoon
//
//  Created by Nearthlab on 2021/05/17.
//

import Foundation

func sol_14501() {
    let N = Int(readLine() ?? "") ?? 0
    var T = [Int].init(repeating: 0, count: N + 1)
    var P = [Int].init(repeating: 0, count: N + 1)
    var dp = [Int].init(repeating: 0, count: N + 1)
    
    for i in 1...N {
        let input = (readLine() ?? "").components(separatedBy: " ").map { Int($0) ?? 0 }
        T[i] = input[0]
        P[i] = input[1]
        dp[i] = input[1]
    }
    
    for i in 2...N {
        for j in 1..<i {
            if i - j >= T[j] {
                dp[i] = max(P[i] + dp[j], dp[i])
            }
        }
    }
    
    var max = 0
    for i in 1...N {
        if i + T[i] - 1 <= N {
            max = dp[i] > max ? dp[i] : max
        }
    }
    
    print(max)
}
