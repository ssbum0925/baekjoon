//
//  Stack.swift
//  baekjoon
//
//  Created by Nearthlab on 2021/04/09.
//

import Foundation

class Stack {
    var top = -1
    var stackSize = -1
    var stack = [String]()
    
    init(stackSize: Int) {
        stack = [String](repeating: "", count: stackSize)
        self.stackSize = stackSize
    }
    
    func push(element: String) {
        if top == stackSize - 1 {
            return
        }
        
        top += 1
        stack[top] = element
    }
    
    func pop() -> String {
        if top == -1 {
            return ""
        }
        
        let elemet = stack[top]
        top -= 1
        return elemet
    }
    
    func isEmpty() -> Bool {
        return top == -1
    }
    
    func popAll() -> String {
        var result = ""
        while !isEmpty() {
            result += pop()
        }
        return result
    }
}
