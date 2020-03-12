import Foundation

public struct LinkedList<T> {
    public var head: Node<T>?
    public var tail: Node<T>?
    
    public init() {}
    public var isEmpty: Bool {
        return head == nil
    }
    
    public mutating func push(_ value: T) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ value: T) {
        guard !isEmpty else {
            push(value)
            return
        }
        tail?.next = Node(value: value)
        tail = tail?.next
    }
    
    public func node(at index: Int) -> Node<T>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }
    
    @discardableResult
    public mutating func insert(_ value: T, after node: Node<T>) -> Node<T> {
        guard tail !== node else {
            append(value)
            return tail!
        }
        
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    @discardableResult
    public mutating func pop() -> T? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}
