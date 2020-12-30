import Foundation

class HoffNode {
    var chars: String
    var value: Int = -1
    var leftChild: HoffNode?
    var rightChild: HoffNode?

    init(chars: String, value: Int, leftChild: HoffNode?, rightChild: HoffNode?) {
        self.chars = chars
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

class Hoffman {
    var priorityQueue: [HoffNode] = []
    var head: HoffNode?

    init(someString: String) {
        var freqMap: [Character: Int] = [:]
        for c in someString {
            freqMap[c, default: 0] += 1
        }
        // Sort the freqMap
        var sortedFreqs: [(Int, Character)] = []
        for (c, count) in freqMap {
            sortedFreqs.append((count, c))
        }
        sortedFreqs.sort { tuple, tuple2 in  tuple.0 > tuple2.0 }
        priorityQueue = sortedFreqs.map { i, c -> HoffNode in HoffNode(chars: String(c), value: i, leftChild: nil, rightChild: nil) }
    }

    func insertIntoPriorityQueue(node: HoffNode) {
        for (idx, pNode) in priorityQueue.enumerated() {
            if pNode.value < node.value {
                priorityQueue.insert(node, at: idx)
                return
            }
        }
    }

    func makeTrees(node: HoffNode?) {
        guard priorityQueue.count > 0 else {
           fatalError("Priority Queue is Empty!")
        }
        guard let node = node else {
            return makeTrees(node: priorityQueue.popLast())
        }
        // We have a node so we can make a new combined HoffNode
        let poppedNode: HoffNode! = priorityQueue.popLast()
        var newNode = HoffNode(
                chars: [poppedNode.chars, node.chars].joined(separator: "+"),
                value: poppedNode.value + node.value,
                leftChild: poppedNode,
                rightChild: node)
        // Lets append this newNode back in
        for (idx, node) in priorityQueue.enumerated() {

        }

    }
}

