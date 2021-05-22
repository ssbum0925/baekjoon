//
//  2839.swift
//  baekjoon
//
//  Created by Nearthlab on 2021/05/19.
//

import Foundation

func sol_2839() {
    let N = Int(readLine() ?? "") ?? 0
    let result = solve_2839(N: N)
    print(result)
}

func solve_2839(N: Int) -> Int {
    let A = 5
    let B = 3
    
    let maxA = N / A
    
    var result = -1
    for i in 0...maxA {
        let numA = maxA - i
        let temp = N - (numA * A)
        if (temp % B) == 0 {
            result = numA + (temp / B)
            break
        }
    }
    return result
}
