//
//  Queue.swift
//  baekjoon
//
//  Created by Nearthlab on 2021/04/09.
//

import Foundation

class Queue {
    var head = 0
    var tail = 0
    var queue = [[String: Any]]()
    var queueSize = -1
    
    init(queueSize: Int) {
        queue = [[String: Any]](repeating: ["": ""], count: queueSize)
        self.queueSize = queueSize
    }
    
    func isEmpty() -> Bool {
        return head == tail
    }
    
    func enqueue(element: [String: Any]) {
        if (head == 0 && tail == queueSize - 1) || (tail + 1 == head) {
            return
        }
        queue[tail] = element
        
        if tail == queueSize - 1 {
            tail = 0
        } else {
            tail += 1
        }
    }
    
    func dequeue() -> [String: Any] {
        if isEmpty() {
            return ["": ""]
        }
        
        let element = queue[head]
        
        if head == queueSize - 1 {
            head = 0
        } else {
            head += 1
        }
        return element
    }
    
    func printQueue() {
        var result = ""
        var index = head
        while index != tail {
            result += ", \(queue[index])"
            if index == queueSize - 1 {
                index = 0
            } else {
                index += 1
            }
        }
        print(result)
    }
    
    func copy() -> Queue {
        let newQueue = Queue(queueSize: self.queueSize)
        newQueue.head = self.head
        newQueue.tail = self.tail
        newQueue.queue = self.queue
        return newQueue
    }
}
