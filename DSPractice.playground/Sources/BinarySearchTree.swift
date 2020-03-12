import Foundation

public struct BinarySearchTree<T: Comparable> {
    public private(set) var root: BinaryNode<T>?
    public init () {}
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        return root.debugDescription.description
    }
}

extension BinarySearchTree {
    public mutating func insert(_ value: T) {
        root = insert(from: root, value: value)
    }
    
    private func insert(from node: BinaryNode<T>?, value: T) -> BinaryNode<T> {
        // 1.)
        guard let node = node else {
            return BinaryNode(value: value)
        }
        
        // 2.)
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        
        return node
    }
}

extension BinarySearchTree {
    public func contains(_ value: T) -> Bool {
        guard let root = root else {
            return false
        }
        var found = false
        root.traverseInOrder {
            if $0 == value {
                found = true
            }
        }
        return found
    }
}
