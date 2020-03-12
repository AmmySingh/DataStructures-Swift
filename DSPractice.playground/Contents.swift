// Book: https://issuu.com/nadirchine/docs/data-structure-algorithms-swift //

// For: Search, insertion, removal
// Time complexity of Binary Tree: O(log n)
// Time complexity of Array:       O(n)
// Time complexity of Binary Tree is less then linear data structure such as array and linked list.

import Cocoa


//----------------------------------//
//              NODE                //
//----------------------------------//
let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)
node1.next = node2
node2.next = node3
print(node1)


//----------------------------------//
//           LinkedList             //
//----------------------------------//

// 1.) -- PUSH -- //
var listP = LinkedList<Int>()
listP.push(3)
listP.push(2)
listP.push(1)
print(listP)

// 2.) -- Insert -- //
print("Before insertion: \(listP)")
var middleNode = listP.node(at: 1)!
for _ in 1...4 {
    middleNode = listP.insert(-1, after: middleNode)
}
print("After insertion: \(listP)")

// 3.) -- APPEND -- //
var listA = LinkedList<Int>()
listA.append(1)
listA.append(2)
listA.append(3)
print(listA)

// 4.) -- POP -- //
print("Before popping list: \(listA)")
let poppedCalue = listA.pop()
print("After popping list: \(listA)")
print("Popped value: " + String(describing: poppedCalue))


//----------------------------------//
//              TREE                //
//----------------------------------//

func makeBeveragesTree() -> TreeNode<String> {
    let tree = TreeNode("Beverages")
    let hot = TreeNode("hot")
    let cold = TreeNode("cold")
    
    // HOT
    let tea = TreeNode("tea")
    let coffee = TreeNode("coffee")
    let chocolate = TreeNode("cocoa")
    
    // TEA - HOT
    let blackTea = TreeNode("black")
    let greenTea = TreeNode("green")
    let chaiTea = TreeNode("chai")
    
    // COLD
    let soda = TreeNode("soda")
    let milk = TreeNode("milk")
    
    // Drinks - COLD
    let gingerAle = TreeNode("ginger ale")
    let bitterLemon = TreeNode("bitter lemon")
    
    tree.add(hot)
    tree.add(cold)
    
    hot.add(tea)
    hot.add(coffee)
    hot.add(chocolate)
    
    cold.add(soda)
    cold.add(milk)
    
    tea.add(blackTea)
    tea.add(greenTea)
    tea.add(chaiTea)
    
    soda.add(gingerAle)
    soda.add(bitterLemon)
    
    return tree
}

// 1.) -- Traverse 1 node complete till depth -- //
let tree = makeBeveragesTree()
tree.forEachDepthFirst(visit: { print($0.value) })

// 2.) -- Traverse nodes by level-order like level 0, 1 and so on -- //
let levelTree = makeBeveragesTree()
levelTree.forEachLevelOrder(visit: { print($0.value) })

// 3.) -- Search node by traverse nodes by level-order -- //
if let searchedItem = tree.search("green") {
    print("Found node: \(searchedItem)")
} else {
    print("Couldn't find")
}


//----------------------------------//
//           BINARY TREE            //
//----------------------------------//

var binaryTree: BinaryNode<Int> {
    
    let zero = BinaryNode(value: 0)
    let one = BinaryNode(value: 1)
    let five = BinaryNode(value: 5)
    let seven = BinaryNode(value: 7)
    let eight = BinaryNode(value: 8)
    let nine = BinaryNode(value: 9)
    
    seven.leftChild = one
    one.leftChild = zero
    one.rightChild = five
    seven.rightChild = nine
    nine.leftChild = eight
    
    return seven
}

print("Pre - Order traversal")
binaryTree.traversePreOrder { print($0) }  // Traverse root node in the first,  Root -> Left -> Right
print("In - Order traversal")
binaryTree.traverseInOrder { print($0) }   // Traverse root node in the middle, Left -> Root -> Right
print("Post - Order traversal")
binaryTree.traversePostOrder { print($0) } // Traverse root node in the last,   Left -> Right -> Root


// 1.) -- Insertion -- //
var bst = BinarySearchTree<Int>()
for i in 0..<5 {
    bst.insert(i)
}
print(bst)

print("Print binary tree")
var bst1 = BinarySearchTree<Int>()
bst1.insert(3)
bst1.insert(1)
bst1.insert(4)
bst1.insert(0)
bst1.insert(2)
bst1.insert(5)
print(bst1)


// 2.) -- Search -- //
if bst1.contains(5) {
    print("Found 5")
} else {
    print("Couldn't find 5")
}
