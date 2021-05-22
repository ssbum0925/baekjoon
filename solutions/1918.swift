//
//  1918.swift
//  baekjoon
//
//  Created by Nearthlab on 2021/04/09.
//

import Foundation

func sol_1918() {
    let stack = Stack(stackSize: 100)
    let infix = readLine() ?? ""
    var result = ""
    let operators = ["+", "-", "*", "/", "(", ")"]
    
    func handlePlusMinus(element: String) {
        if stack.isEmpty() {
            stack.push(element: element)
        } else {
            while !stack.isEmpty() {
                let top = stack.pop()
                if top == "(" {
                    stack.push(element: top)
                    break
                }
                result += top
            }
            stack.push(element: element)
        }
    }

    func handleMulDiv(element: String) {
        stack.push(element: element)
    }

    func handleParentheses(element: String) {
        if element == "(" {
            stack.push(element: element)
        } else {
            while true {
                let top = stack.pop()
                if top == "(" {
                    break
                }
                result += top
            }
        }
    }
    
    for element in infix {
        let elementString = "\(element)"
        if !operators.contains(elementString) {
            result += elementString
        } else {
            if elementString == "+" || elementString == "-" {
                handlePlusMinus(element: elementString)
            } else if elementString == "*" || elementString == "/" {
                handleMulDiv(element: elementString)
            } else if elementString == "(" || elementString == ")" {
                handleParentheses(element: elementString)
            }
        }
    }
    
    result += stack.popAll()
    print(result)
}
