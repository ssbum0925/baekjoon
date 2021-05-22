//
//  10942.swift
//  baekjoon
//
//  Created by Nearthlab on 2021/05/09.
//

import Foundation

func sol_10942() {
    let N = Int(readLine() ?? "") ?? 0
    var numbers = (readLine() ?? "").components(separatedBy: " ").map { input -> Int in
        return Int(input) ?? 0
    }
    numbers.insert(0, at: 0)
    
    var palindrome = [[Int]](repeating: [Int](repeating: 0, count: N + 1), count: N + 1)
    
    for i in 1...N {
        palindrome[i][i] = 1
    }
    
    for i in 1..<N {
        if numbers[i] == numbers[i + 1] {
            palindrome[i][i + 1] = 1
        }
    }
    
    for i in 2..<N {
        for j in 1...(N - i) {
            if numbers[j] == numbers[j + i] && palindrome[j + 1][j + i - 1] == 1 {
                palindrome[j][j + i] = 1
            }
        }
    }
    
    
    var results = [Int]()
    let M = Int(readLine() ?? "") ?? 0
    
    for _ in 0..<M {
        let test = (readLine() ?? "").components(separatedBy: " ").map { input -> Int in
            return Int(input) ?? 0
        }
        let S = test[0]
        let E = test[1]
        results.append(palindrome[S][E])
    }
    
    for result in results {
        print(result)
    }
}

