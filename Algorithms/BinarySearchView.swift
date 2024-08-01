//
//  PascalTriangleView.swift
//  Algorithms
//
//  Created by Marco Abundo on 5/22/24.
//

import SwiftUI

struct BinarySearchView: View {
    let array = [1, 3, 4, 5, 12, 13, 22, 31, 72]
    @State private var userInput: String = ""
    @State private var foundIndex = -1

    var body: some View {
        VStack {
            Text("Array is:\n\(array)")
            TextField("Enter a number to search for:", text: $userInput)
                .keyboardType(.numberPad)
                .padding()

            Button(action: {
                // Call the external function and update the outputResult
                if let input = Int(userInput) {
                    foundIndex = Algorithms.binarySearch(array, input) ?? -1
                } else {
                    // Handle invalid input
                    foundIndex = -1
                }
            }) {
                Text("Calculate")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }

            Text("Number is found at index:\n\(String(describing: foundIndex))")
        }
        .padding()
    }
}

#Preview {
    BinarySearchView()
}
