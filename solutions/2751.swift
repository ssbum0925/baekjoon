//
//  2751.swift
//  baekjoon
//
//  Created by Nearthlab on 2021/03/08.
//

import Foundation

func sol_2751() {
    let N = Int(readLine() ?? "") ?? 0
    var input = [Int]()
    
    if N < 1 || 1000000 < N {
        return
    }
    
    for _ in 0..<N {
        let element = Int(readLine() ?? "") ?? 0
        input.append(element)
    }
    
    let result = mergeSort(input: input)
    result.forEach { (element) in
        print(element)
    }
}

func mergeSort(input: [Int]) -> [Int] {
    if input.count == 0 {
        return input
    }
    
    if input.count == 1 {
        return input
    }
    
    let center = input.count / 2
    return merge(arr1: mergeSort(input: [Int](input[0..<center])), arr2: mergeSort(input: [Int](input[center..<input.count])))
}

func merge(arr1: [Int], arr2: [Int]) -> [Int] {
    var result = [Int]()
    var count = 0
    
    let arr1Count = arr1.count
    var arr1Index = 0
    
    let arr2Count = arr2.count
    var arr2Index = 0
    
    while count < arr1Count + arr2Count {
        if arr1Index == arr1Count {
            result += arr2[arr2Index...]
            break
        } else if arr2Index == arr2Count {
            result += arr1[arr1Index...]
            break
        } else if arr1[arr1Index] < arr2[arr2Index] {
            result.append(arr1[arr1Index])
            arr1Index += 1
        } else {
            result.append(arr2[arr2Index])
            arr2Index += 1
        }
        count += 1
    }
    return result
}
