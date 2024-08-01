//
//  PascalTriangleView.swift
//  Algorithms
//
//  Created by Marco Abundo on 5/22/24.
//

import SwiftUI

struct ReverseLinkedListView: View {
    let linkedList = Algorithms.createLinkedList()
    @State var reversedLinkedList: Algorithms.ListNode?

    var body: some View {
        VStack {
            Text("Linked list is:\n\(printLinkedList(linkedList))")

            Button(action: {
                // Call the external function and update the outputResult
                self.reversedLinkedList = Algorithms.reverseList(linkedList)
            }) {
                Text("Calculate")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }

            if let reversedLinkedList = reversedLinkedList {
                Text("Reversed list is:\n\(printLinkedList(reversedLinkedList))")
            }
        }
        .padding()
    }

    func printLinkedList(_ node: ListNode) -> String {
        var curr: ListNode? = node
        var str = ""
        while curr != nil {
            str += "\(curr?.value ?? 0) -> "
            curr = curr?.next
        }
        return String(str.dropLast(4))
    }
}

#Preview {
    ReverseLinkedListView()
}
