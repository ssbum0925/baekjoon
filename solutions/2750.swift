//
//  2750.swift
//  baekjoon
//
//  Created by Nearthlab on 2021/03/08.
//

import Foundation

func sol_2750() {
    let N = Int(readLine() ?? "") ?? 0
    var input = [Int]()

    for _ in 0..<N {
        let number = Int(readLine() ?? "") ?? 0
        input.append(number)
    }

    let result = insertionSort(input: input)
    result.forEach { (element) in
        print(element)
    }

}

func insertionSort(input: [Int]) -> [Int] {
    if input.count == 0 {
        return input
    }
    
    var inputCopy = input
    for i in 1..<inputCopy.count {
        let key = inputCopy[i]
        var j = i - 1
        while j >= 0 && inputCopy[j] > key {
            inputCopy[j + 1] = inputCopy[j]
            inputCopy[j] = key
            j -= 1
        }
    }
    
    return inputCopy
}

func bubbleSort(input: [Int]) -> [Int] {
    if input.count == 0 || input.count == 1 {
        return input
    }
    
    var inputCopy = input
    
    for i in 0..<inputCopy.count - 1 {
        for j in 1..<inputCopy.count - i {
            if inputCopy[j - 1] > inputCopy[j] {
                let temp = inputCopy[j]
                inputCopy[j] = inputCopy[j - 1]
                inputCopy[j - 1] = temp
            }
        }
    }
    return inputCopy
}
