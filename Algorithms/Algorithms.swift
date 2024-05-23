//
//  Algorithms.swift
//  Algorithms
//
//  Created by Marco Abundo on 5/22/24.
//

import Foundation

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
