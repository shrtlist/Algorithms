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
                NavigationLink("Pascal's Triangle", destination: PascalTriangleView())
            }
            .listStyle(.plain)
            .navigationTitle("Algorithms")
        }
    }
}

#Preview {
    ContentView()
}
