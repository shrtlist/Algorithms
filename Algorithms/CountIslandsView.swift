//
//  CountIslandsView.swift
//  Algorithms
//
//  Created by Marco Abundo on 5/30/24.
//

import SwiftUI

struct CountIslandsView: View {
    let grid = [
        ["1", "0", "1"],
        ["1", "0", "1"],
        ["1", "0", "1"],
        ["1", "0", "1"],
        ["0", "0", "0"],
        ["1", "1", "1"],
    ]

    @State var result: Int = 0

    var body: some View {
        VStack {
            Text("Grid is:\n\(grid)")

            Button(action: {
                // Call the external function and update the outputResult
                result = Algorithms.countIslands(grid)
            }) {
                Text("Calculate")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }

            Text("Number of islands:\n\(String(describing: result))")
        }
        .padding()
    }
}

#Preview {
    CountIslandsView()
}
