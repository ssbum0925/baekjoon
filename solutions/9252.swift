//
//  9252.swift
//  baekjoon
//
//  Created by Nearthlab on 2021/05/16.
//

import Foundation

func sol_9252() {
    let s1 = (readLine() ?? "").map { String($0) }
    let s2 = (readLine() ?? "").map { String($0) }
    
    let (count, LCS) = findLCS_9252(s1: s1, s2: s2)
    print(count)
    print(LCS)
}

func findLCS_9252(s1: [String], s2: [String]) -> (Int, String) {
    if s1.count == 0 || s2.count == 0 {
        return (0, "")
    }
    
    var dp = [[(Int, String)]].init(repeating: [(Int, String)].init(repeating: (0, ""), count: s2.count + 1), count: s1.count + 1)
    
    for i in 1...s1.count {
        for j in 1...s2.count {
            if s1[i - 1] == s2[j - 1] {
                dp[i][j] = (dp[i - 1][j - 1].0 + 1, dp[i - 1][j - 1].1 + s1[i - 1])
            } else {
                if dp[i - 1][j].0 > dp[i][j - 1].0 {
                    dp[i][j] = (dp[i - 1][j].0, dp[i - 1][j].1)
                } else {
                    dp[i][j] = (dp[i][j - 1].0, dp[i][j - 1].1)
                }
            }
        }
    }
    
    var max = (0, "")
    for i in 1...s1.count {
        for j in 1...s2.count {
            max = dp[i][j].0 > max.0 ? dp[i][j] : max
        }
    }
    
    return max
}
