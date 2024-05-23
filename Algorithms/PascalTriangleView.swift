//
//  PascalTriangleView.swift
//  Algorithms
//
//  Created by Marco Abundo on 5/22/24.
//

import SwiftUI

struct PascalTriangleView: View {
    @State private var userInput: String = ""
    @State private var outputResult: [[Int]] = []

    var body: some View {
        VStack {
            TextField("Enter a number", text: $userInput)
                .keyboardType(.numberPad)
                .padding()

            Button(action: {
                // Call the external function and update the outputResult
                if let input = Int(userInput) {
                    outputResult = Algorithms.solvePascalsTriangle(input)
                } else {
                    // Handle invalid input
                    outputResult = []
                }
            }) {
                Text("Calculate")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }

            let result = outputResult.map { "\($0)" }.joined(separator: "\n")
            Text("Result:\n\(result)")
        }
        .padding()
    }
}

#Preview {
    PascalTriangleView()
}
