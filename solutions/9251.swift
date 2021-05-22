//
//  9252.swift
//  baekjoon
//
//  Created by Nearthlab on 2021/05/16.
//

import Foundation

func sol_9251() {
    let s1 = (readLine() ?? "").map { String($0) }
    let s2 = (readLine() ?? "").map { String($0) }
    
    let LCS = findLCS_9251(s1: s1, s2: s2)
    print(LCS)
}

func findLCS_9251(s1: [String], s2: [String]) -> Int {
    if s1.count == 0 || s2.count == 0 {
        return 0
    }
    
    var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: s2.count + 1), count: s1.count + 1)
    
    for i in 1...s1.count {
        for j in 1...s2.count {
            if s1[i - 1] == s2[j - 1] {
                dp[i][j] = dp[i - 1][j - 1] + 1
            } else {
                dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
            }
        }
    }
    
    var max = 0
    for i in 1...s1.count {
        for j in 1...s2.count {
            max = dp[i][j] > max ? dp[i][j] : max
        }
    }
    
    return max
}
