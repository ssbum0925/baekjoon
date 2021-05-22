//
//  11508.swift
//  baekjoon
//
//  Created by Nearthlab on 2021/05/19.
//

import Foundation

func sol_11508() {
    let N = Int(readLine() ?? "") ?? 0
    var list = [Int]()
    
    for _ in 0..<N {
        let C = Int(readLine() ?? "") ?? 0
        list.append(C)
    }
    
    let sorted = list.sorted { $0 > $1 }
    var result = 0
    for i in 0..<N {
        if (i % 3) == 2 {
            continue
        }
        result += sorted[i]
    }
    
    print(result)
}
