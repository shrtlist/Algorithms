//
//  PascalTriangleView.swift
//  Algorithms
//
//  Created by Marco Abundo on 5/22/24.
//

import SwiftUI

struct SpiralTraverseView: View {

    let matrix = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
        [10, 11, 12],
    ]

    @State var result = [Int]()

    var body: some View {
        VStack {
            Text("Matrix is:\n\(printMatrix(matrix))")

            Button(action: {
                // Call the external function and update the outputResult
                result = Algorithms.spiralTraverse(matrix)
            }) {
                Text("Calculate")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }

            Text("Spiral traverse is:\n\(result))")
        }
        .padding()
    }

    func printMatrix(_ matrix: [[Int]]) -> String {
        var str = ""
        for m in 0..<matrix.count {
           for n in 0..<matrix[m].count {
               let element = String(matrix[m][n])
               str.append(element)

               if n < matrix[m].count {
                   str.append(" ")
               }
           }
            str.append("\n")
        }
        return str
    }
}

#Preview {
    SpiralTraverseView()
}
