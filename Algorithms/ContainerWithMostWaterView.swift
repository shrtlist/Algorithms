//
//  ContainerWithMostWaterView.swift
//  Algorithms
//
//  Created by Marco Abundo on 5/22/24.
//

import SwiftUI

struct ContainerWithMostWaterView: View {
    let heights = [1, 8, 6, 2, 5, 4, 8, 3, 7]
    @State private var result = -1

    var body: some View {
        VStack {
            Text("Heights: \(heights)")

            Button(action: {
                // Call the external function and update the outputResult
                result = Algorithms.getMaxArea(heights)
            }) {
                Text("Calculate")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }

            Text("Result:\n\(result)")
        }
        .padding()
    }
}

#Preview {
    PascalTriangleView()
}
