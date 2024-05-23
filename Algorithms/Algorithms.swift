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
