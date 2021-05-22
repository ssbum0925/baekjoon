//
//  10162.swift
//  baekjoon
//
//  Created by Nearthlab on 2021/05/19.
//

import Foundation

func sol_10162() {
    let T = Int(readLine() ?? "") ?? 0
    
    let result = solve(T: T)
    if result.A == -1 {
        print("-1")
    } else {
        print("\(result.A) \(result.B) \(result.C)")
    }
}

func solve(T: Int) -> (A: Int, B: Int, C: Int) {
    let A = 300
    let B = 60
    let C = 10
    
    if (T % 10) != 0 {
        return (A: -1, B: -1, C: -1)
    }
    
    let resultA = T / A
    var temp = T - (resultA * A)
    let resultB = temp / B
    temp -= (resultB * B)
    let resultC = temp / C
    return (A: resultA, B: resultB, C: resultC)
}
