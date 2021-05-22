//
//  10211.swift
//  baekjoon
//
//  Created by Nearthlab on 2021/03/18.
//

import Foundation

func sol_10211() {
    let T = Int(readLine() ?? "") ?? 0
    var inputs = [[Int]]()
    
    for _ in 0..<T {
        let N = Int(readLine() ?? "") ?? 0
        if 1 <= N && N <= 1000 {
            let inputStringList = (readLine() ?? "").components(separatedBy: " ")
            let inputIntList = inputStringList.map { element in
                return Int(element) ?? 0
            }
            inputs.append(inputIntList)
        }
    }
    
    inputs.forEach { inputList in
        let (_, _, sum) = findMaximumSubarray(low: 0, high: inputList.count - 1, input: inputList)
        print(sum)
    }
}

func findMaximumSubarrayCross(low: Int, high: Int, input: [Int]) -> (low: Int, high: Int, sum: Int) {
    if high - low == 0 {
        return (low: low, high: low, sum: input[low])
    }
    
    let mid = (low + high) / 2
    var i = mid
    var leftSum = 0
    var leftSumMax = Int.min
    var leftIndex = i
    while i >= low {
        let key = input[i]
        leftSum += key
        if leftSumMax < leftSum {
            leftSumMax = leftSum
            leftIndex = i
        }
        i -= 1
    }
    
    var j = mid + 1
    var rightSum = 0
    var rightSumMax = Int.min
    var rightIndex = j
    while j <= high {
        let key = input[j]
        rightSum += key
        if rightSumMax < rightSum {
            rightSumMax = rightSum
            rightIndex = j
        }
        j += 1
    }
    return (low: leftIndex, high: rightIndex, sum: leftSumMax + rightSumMax)
}

func findMaximumSubarray(low: Int, high: Int, input: [Int]) -> (low: Int, high: Int, sum: Int) {
    if high - low == 0 {
        return (low: low, high: low, sum: input[low])
    }
    
    let mid = (low + high) / 2
    let (leftLow, leftHigh, leftSum) = findMaximumSubarray(low: low, high: mid, input: input)
    let (rightLow, rightHigh, rightSum) = findMaximumSubarray(low: mid + 1, high: high, input: input)
    let (crossLow, crossHigh, crossSum) = findMaximumSubarrayCross(low: low, high: high, input: input)
    
    if leftSum >= rightSum && leftSum >= crossSum {
        return (low: leftLow, high: leftHigh, sum: leftSum)
    } else if rightSum >= leftSum && rightSum >= crossSum {
        return (low: rightLow, high: rightHigh, sum: rightSum)
    } else {
        return (low: crossLow, high: crossHigh, sum: crossSum)
    }
}

