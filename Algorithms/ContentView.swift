//
//  ContentView.swift
//  Algorithms
//
//  Created by Marco Abundo on 5/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Binary Search", destination: BinarySearchView())
                NavigationLink("Container with most water", destination: ContainerWithMostWaterView())
                NavigationLink("Count Islands", destination: CountIslandsView())
                NavigationLink("Merge Sort", destination: MergeSortView())
                NavigationLink("Get Nth Prime Number", destination: NthPrimeNumberView())
                NavigationLink("Reversed Linked List", destination: ReverseLinkedListView())
                NavigationLink("Pascal's Triangle", destination: PascalTriangleView())
                NavigationLink("Spiral Traverse", destination: SpiralTraverseView())
                NavigationLink("Three Largest Numbers", destination: ThreeLargestNumbersView())
            }
            .listStyle(.plain)
            .navigationTitle("Algorithms")
        }
    }
}

#Preview {
    ContentView()
}
