//
//  2504.swift
//  baekjoon
//
//  Created by Nearthlab on 2021/04/12.
//

import Foundation

func sol_2504() {
    let input = readLine() ?? ""
    let result = sol(input: input)
    print(result)
}

func sol(input: String) -> Int {
    let stack = Stack(stackSize: 50)
    var result = 0
    
    func checkValidation(input: String) -> Bool {
        let stack = Stack(stackSize: 50)
        for element in input {
            let elementString = "\(element)"
            if elementString == "(" || elementString == "[" {
                stack.push(element: elementString)
            } else {
                let next = stack.pop()
                if (elementString == ")" && next == "(") || (elementString == "]" && next == "[") {
                    continue
                } else {
                    stack.push(element: next)
                    stack.push(element: elementString)
                }
            }
        }
        return stack.isEmpty()
    }
    
    func handleCloseRoundBracket() {
        var temp = -1
        while !stack.isEmpty() {
            let top = stack.pop()
            if top == "(" {
                if temp == -1 {
                    stack.push(element: "2")
                } else {
                    stack.push(element: "\(2 * (temp + 1))")
                }
                break
            } else if let number = Int(top) {
                temp += number
            }
        }
    }
    
    func handleCloseSquareBracket() {
        var temp = -1
        while !stack.isEmpty() {
            let top = stack.pop()
            if top == "[" {
                if temp == -1 {
                    stack.push(element: "3")
                } else {
                    stack.push(element: "\(3 * (temp + 1))")
                }
                break
            } else if let number = Int(top) {
                temp += number
            }
        }
    }
    
    if !checkValidation(input: input) {
        return 0
    }
    
    for element in input {
        let elementString = "\(element)"
        if elementString == "(" || elementString == "[" {
            stack.push(element: elementString)
        } else if elementString == ")" {
            handleCloseRoundBracket()
        } else if elementString == "]" {
            handleCloseSquareBracket()
        }
    }
    
    while !stack.isEmpty() {
        let top = stack.pop()
        let value = Int(top) ?? 0
        result += value
    }
    return result
}
