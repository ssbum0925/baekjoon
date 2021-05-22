//
//  2225.swift
//  baekjoon
//
//  Created by Nearthlab on 2021/05/16.
//

import Foundation

func sol_2225() {
    let input = (readLine() ?? "").components(separatedBy: " ")
    let N = Int(input[0]) ?? 0
    let K = Int(input[1]) ?? 0
    
    var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: N + 1), count: K + 1)
    for i in 0...N {
        dp[1][i] = 1
    }
    
    if K == 1 {
        print("1")
        return
    }

    for i in 2...K {
        for j in 0...N {
            for k in 0...j {
                dp[i][j] += dp[i - 1][j - k]
                dp[i][j] %= 1000000000
            }
        }
    }

    print(dp[K][N] % 1000000000)
}

