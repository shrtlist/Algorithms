//
//  ThreeLargestNumbersView.swift
//  Algorithms
//
//  Created by Marco Abundo on 5/23/24.
//

import SwiftUI

struct ThreeLargestNumbersView: View {
    @State private var userInput: String = ""
    @State private var outputResult: [Int] = []

    var body: some View {
        VStack {
            TextField("Enter an array of numbers", text: $userInput)
                .keyboardType(.numberPad)
                .padding()

            Button(action: {
                // Call the external function and update the outputResult
                let array = userInput.components(separatedBy: ", ")
                let arrayInt = array.compactMap { Int($0) }
                outputResult = Algorithms.threeLargestNumbers(array: arrayInt)
            }) {
                Text("Calculate")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }

            let result = outputResult.map { "\($0)" }.joined(separator: ", ")
            Text("Result:\n\(result)")
        }
        .padding()
    }
}

#Preview {
    PascalTriangleView()
}
