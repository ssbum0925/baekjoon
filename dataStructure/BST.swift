//
//  BST.swift
//  baekjoon
//
//  Created by Nearthlab on 2021/04/25.
//

import Foundation

class BST {
    class Node {
        var left: Node?
        var right: Node?
        var parent: Node?
        var key: Int
        
        init(left: Node? = nil, right: Node? = nil, parent: Node? = nil, key: Int) {
            self.left = left
            self.right = right
            self.parent = parent
            self.key = key
        }
    }
    
    var root: Node?
    
    init(root: Node? = nil) {
        self.root = root
    }
    
    func inorderTreeWalk(x: Node?) {
        if let x = x {
            inorderTreeWalk(x: x.left)
            print(x.key)
            inorderTreeWalk(x: x.right)
        }
    }
    
    func insert(value: Int) {
        var y: Node? = nil
        var x = root
        let z = Node(key: value)
        
        while let _x = x {
            y = _x
            if z.key < _x.key {
                x = _x.left
            } else {
                x = _x.right
            }
        }
        
        z.parent = y
        if let _y = y {
            if z.key < _y.key {
                y?.left = z
            } else {
                y?.right  = z
            }
        } else {
            root = z
        }
        
        inorderTreeWalk(x: root)
    }
    
    func transplant(u: Node, v: Node?) {
        if let uParent = u.parent {
            if let uParentLeft = uParent.left {
                if u === uParentLeft {
                    u.parent?.left = v
                }
            } else if let uParentRight = uParent.right {
                if u === uParentRight {
                    u.parent?.right = v
                }
            }
        } else {
            root = v
        }
        if let v = v {
            v.parent = u.parent
        }
    }
    
    func treeMinimum(x: inout Node) -> Node {
        while let xLeft = x.left {
            x = xLeft
        }
        return x
    }
    
    func delete(value: Int) {
        guard let z = treeSearch(x: root, k: value) else {
            return
        }
        if z.left == nil {
            transplant(u: z, v: z.right)
        } else if z.right == nil {
            transplant(u: z, v: z.left)
        } else {
            let y = treeMinimum(x: &z.right!)
            if let yParent = y.parent {
                if yParent !== z {
                    transplant(u: y, v: y.right)
                    y.right = z.right
                    y.right?.parent = y
                }
            }
            transplant(u: z, v: y)
            y.left = z.left
            y.left?.parent = y
        }
    }
    
    func treeSearch(x: Node?, k: Int) -> Node? {
        if x == nil || k == x!.key {
            return x
        }
        if k < x!.key {
            return treeSearch(x: x?.left, k: k)
        } else {
            return treeSearch(x: x?.right, k: k)
        }
    }
}
