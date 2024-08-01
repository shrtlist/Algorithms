//
//  MergeSortView.swift
//  Algorithms
//
//  Created by Marco Abundo on 5/22/24.
//

import SwiftUI

struct MergeSortView: View {
    let testArray = [12, 3, 13, 111, 987, 71, 17, 22, 3, 89, 18, 12]
    @State var sortedArray = [Int]()

    var body: some View {
        VStack {
            Text("Array is:\n\(testArray)")

            Button(action: {
                // Call the external function and update the outputResult
                sortedArray = Algorithms.mergeSort(testArray)
            }) {
                Text("Calculate")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }

            Text("Sorted array:\n\(String(describing: sortedArray))")
        }
        .padding()
    }
}

#Preview {
    MergeSortView()
}
