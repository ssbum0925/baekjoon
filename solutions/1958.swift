//
//  1958.swift
//  baekjoon
//
//  Created by Nearthlab on 2021/05/16.
//

import Foundation

func sol_1958() {
    let s1 = (readLine() ?? "").map { String($0) }
    let s2 = (readLine() ?? "").map { String($0) }
    let s3 = (readLine() ?? "").map { String($0) }
    
    let LCS = findLCS(s1: s1, s2: s2, s3: s3)
    print(LCS)
}

func findLCS(s1: [String], s2: [String], s3: [String]) -> Int {
    var dp = [[[Int]]].init(repeating: [[Int]].init(repeating: [Int].init(repeating: 0, count: s3.count + 1), count: s2.count + 1), count: s1.count + 1)
    
    for i in 1...s1.count {
        for j in 1...s2.count {
            for k in 1...s3.count {
                if s1[i - 1] == s2[j - 1] && s2[j - 1] == s3[k - 1] {
                    dp[i][j][k] = dp[i - 1][j - 1][k - 1] + 1
                } else {
                    dp[i][j][k] = max(dp[i - 1][j][k], dp[i][j - 1][k], dp[i][j][k - 1])
                }
            }
        }
    }
    
    var max = 0
    for i in 1...s1.count {
        for j in 1...s2.count {
            for k in 1...s3.count {
                max = dp[i][j][k] > max ? dp[i][j][k] : max
            }
        }
    }
    
    return max
}
