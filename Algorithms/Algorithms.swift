//
//  Algorithms.swift
//  Algorithms
//
//  Created by Marco Abundo on 5/22/24.
//

import Foundation

func binarySearch(_ array: [Int], _ value: Int) -> Int? {
    guard !array.isEmpty else {
        return nil
    }

    if array.count == 1 {
        return array[0] == value ? 0 : nil
    }

    var left: Int = 0
    var right: Int = array.count - 1

    while left <= right {
        let middleIndex = (left + right) / 2
        let middleValue = array[middleIndex]

        if middleValue > value {
            right = middleIndex - 1
        }
        else if middleValue < value {
            left = middleIndex + 1
        }
        else if middleValue == value {
            // Middle value == value
            return middleIndex
        }
    }

    return nil
}

// Count Islands
// Time: O(M x N)
// Space: O(M x N)
func countIslands(_ grid: [[String]]) -> Int {
    var numberOfIslands = 0
    var matrix = grid

    // Solution
    for i in 0..<matrix.count {
        let row = matrix[i]
        for j in 0..<row.count {
            let value = matrix[i][j]
            if value == "1" {
                numberOfIslands += 1
                // Depth First Search (DFS)
                search(i, j, &matrix)
            }
        }
    }

    return numberOfIslands
}

func search(_ row: Int, _ col: Int, _ grid: inout [[String]]) {
    // Verify base case
    guard row >= 0, row < grid.count, col >= 0, col < grid[0].count else {
        return
    }

    guard grid[row][col] == "1" else {
        return
    }

    // Update value to 0
    grid[row][col] = "0"

    // Search all neightbors
    search(row + 1, col, &grid)
    search(row - 1, col, &grid)
    search(row, col + 1, &grid)
    search(row, col - 1, &grid)
}

func getMaxArea(_ heights: [Int]) -> Int {
    guard !heights.isEmpty else { return -1 }

    var maxArea = 0
    var left = 0
    var right = heights.count - 1

    while left < right {
        // Recalculate maxArea
        let minHeight = min(heights[left], heights[right])
        let currentArea = minHeight * (right - left)

        maxArea = max(maxArea, currentArea)

        // Move pointers
        if heights[left] < heights[right] {
            left += 1
        } else {
            right -= 1
        }
    }

    return maxArea
}
func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }

    // Middle Index
    let middle = array.count/2

    // Left | Right
    let left = mergeSort(Array(array[0..<middle]))
    let right = mergeSort(Array(array[middle..<array.count]))

    // Left + right
    return merge(left, right)
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var leftIdx = 0
    var rightIdx = 0

    var result = [Int]()
    result.reserveCapacity(left.count + right.count)

    while leftIdx < left.count && rightIdx < right.count {
        if left[leftIdx] < right[rightIdx] {
            result.append(left[leftIdx])
            leftIdx += 1
        }
        else if left[leftIdx] > right[rightIdx] {
            result.append(right[rightIdx])
            rightIdx += 1
        }
        else {
            result.append(left[leftIdx])
            result.append(right[rightIdx])
            leftIdx += 1
            rightIdx += 1
        }
    }

    while leftIdx < left.count {
        result.append(left[leftIdx])
        leftIdx += 1
    }

    while rightIdx < right.count {
        result.append(right[rightIdx])
        rightIdx += 1
    }

    return result
}

// Pascal's Triangle

// Time: O(n ^ 2) where n is numRows
// Space: O(n ^ 2) where n is numRows
func solvePascalsTriangle(_ numRows: Int) -> [[Int]] {
    guard numRows > 0 else {
        return []
    }

    if numRows == 1 { return [[1]] }

    var result = [[Int]]()
    result.reserveCapacity(numRows)
    result.append([1]) // 0

    for x in 1..<numRows {
        var newRow = [1]
        let prevRow = result[x - 1]

        for j in 1..<prevRow.count {
            let sum = prevRow[j] + prevRow[j - 1]
            newRow.append(sum)
        }

        newRow.append(1)
        result.append(newRow)
    }

    return result
}

// Three largest numbers

// Time: O(n) where n is number of elements in array
// Space: O(1)
func threeLargestNumbers(array: [Int]) -> [Int] {
    if array.isEmpty {
        return []
    }

    var result = Array(repeating: Int.min, count: 3)

    for num in array {
        rearrange(number: num, result: &result)
    }

    return result
}

private func rearrange(number: Int, result: inout [Int]) {
    // Determine largest number valid criteria
    var toBeInsertedIdx = -1

    if number > result[2] {
        toBeInsertedIdx = 2
    } else if number > result[1] {
        toBeInsertedIdx = 1
    } else if number > result[0] {
        toBeInsertedIdx = 0
    } else {
        return
    }

    // Shifting result backward
    var currentIdx = toBeInsertedIdx
    while currentIdx > 0 {
        let temp = result[currentIdx - 1]
        result[currentIdx - 1] = result[toBeInsertedIdx]
        currentIdx -= 1
        result[toBeInsertedIdx] = temp
    }
    result[toBeInsertedIdx] = number
}

// LinkedList: ListNode
final class ListNode {
    let value: Int
    var next: ListNode?
    init(value: Int) { self.value = value }
}

func createLinkedList() -> ListNode {
    let nodes: [ListNode] = Array(1...10).map { ListNode(value: $0) }
    let head = ListNode(value: 0)
    var curr = head
    for i in 0..<nodes.count {
        curr.next = nodes[i]
        curr = nodes[i]
    }
    return head
}

// MARK: - Reverse Linked List

func reverseList(_ head: ListNode?) -> ListNode? {
    var prevNode: ListNode? = nil
    var headNode = head

    while headNode != nil {
        let nextHead = headNode?.next
        headNode?.next = prevNode
        prevNode = headNode
        headNode = nextHead
    }

    return prevNode
}


// Spiral Traverse

// Time: O(n) where n is number of elem in matrix (1 pass)
// Space: O(mn) where mn = col*row
func spiralTraverse(_ matrix: [[Int]]) -> [Int] {
    guard !matrix.isEmpty else {
        return []
    }

    let total = matrix[0].count * matrix.count

    var result = [Int]()

    var left = 0
    var top = 0
    var right = matrix[0].count - 1
    var bottom = matrix.count - 1

    while result.count < total {
        // Go left to right
        for col in stride(from: left, through: right, by: 1) {
            result.append(matrix[top][col])
        }

        // Go top down
        for row in stride(from: top+1, through: bottom, by: 1) {
            result.append(matrix[row][right])
        }

        // Go right to left
        for col in stride(from: right-1, through: left, by: -1) {
            result.append(matrix[bottom][col])
        }

        // Go up
        for row in stride(from: bottom-1, through: top+1, by: -1) {
            result.append(matrix[row][left])
        }

        left += 1
        top += 1
        right -= 1
        bottom -= 1
    }

    return result.compactMap({ $0 })
}

func getNthPrimeNumber(_ n: Int) -> Int {
    // as an example, 5th prime number (11)
    var primes: [Int] = []
        var i = 2
        while primes.count < n {
            var isPrime = true
            for prime in primes {
                if i % prime == 0 {
                    isPrime = false
                    break
                }
            }
            if isPrime {
                primes.append(i)
            }
            i += 1
        }
        return primes.last!
}
