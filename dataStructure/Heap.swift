//
//  priorityQueue.swift
//  baekjoon
//
//  Created by Nearthlab on 2021/03/22.
//

import Foundation

class Heap {
    var queue: [Int] = []
    var heapSize: Int
    
    init() {
        self.heapSize = queue.count
    }
    
    func minHeapify(i: Int) {
        let left = i * 2
        let right = i * 2 + 1
        var smallest = (left <= heapSize && queue[left] < queue[i]) ? left : i
        
        if right <= heapSize && queue[right] < queue[smallest] {
            smallest = right
        }
        
        if smallest != i {
            let temp = queue[i]
            queue[i] = queue[smallest]
            queue[smallest] = temp
            minHeapify(i: smallest)
        }
    }
    
    func buildMinHeap(queue: [Int]) {
        self.queue = [0] + queue
        self.heapSize = queue.count
        for i in 0...((queue.count / 2) - 1) {
            minHeapify(i: (queue.count / 2) - i)
        }
    }
    
    func extractMin() -> Int {
        if heapSize < 1 {
            return -1
        }
        
        let min = queue[1]
        queue[1] = queue[heapSize]
        heapSize -= 1
        minHeapify(i: 1)
        return min
    }
    
    func decreaseKey(i: Int, key: Int) {
        if key > queue[i] {
            return
        }
        var iCopy = i
        queue[iCopy] = key
        while iCopy > 1 && queue[iCopy / 2] > queue[iCopy] {
            let temp = queue[iCopy]
            queue[iCopy] = queue[iCopy / 2]
            queue[iCopy / 2] = temp
            iCopy /= 2
        }
    }
    
    func insert(key: Int) {
        heapSize += 1
        queue[heapSize] = .min
        decreaseKey(i: heapSize, key: key)
    }
}

