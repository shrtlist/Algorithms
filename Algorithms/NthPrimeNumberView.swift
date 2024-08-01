//
//  NthPrimeNumberView.swift
//  Algorithms
//
//  Created by Marco Abundo on 8/1/24.
//

import SwiftUI

struct NthPrimeNumberView: View {
    @State private var userInput: String = ""
    @State private var outputResult = 0

    var body: some View {
        VStack {
            TextField("Enter the Nth number", text: $userInput)
                .keyboardType(.numberPad)
                .padding()

            Button(action: {
                // Call the external function and update the outputResult
                guard let n = Int(userInput) else { return }
                outputResult = Algorithms.getNthPrimeNumber(n)
            }) {
                Text("Calculate")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }

            Text("Result:\n\(outputResult)")
        }
        .padding()
    }
}

#Preview {
    NthPrimeNumberView()
}
