//
//  NewGrocery.swift
//  Groceries
//
//  Created by admin on 3/11/24.
//

import SwiftUI
import SwiftData

struct NewGrocery: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var name: String = ""
    @State var emoji: String = ""
    @State var remarks: String = ""
    @State var quantity: Int = 0
    
    let emojis = ["🍣", "🍙", "🍜", "🍡"]
    
    var body: some View{
        NavigationStack{
            Form {
                Picker ("Emoji", selection: $emoji){
                    ForEach(emojis, id: \.self ) {emoji in Text(emoji)}
                }
                TextField("Name", text: $name)
                TextField("Remarks", text: $remarks, axis: .vertical)
                    .lineLimit(4)
                Stepper("Quantity: \(quantity)", value: $quantity)
            }
        }
        .navigationTitle("Add Grocery")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItemGroup(placement: .topBarLeading) {
                Button("Cancle"){
                    dismiss()
                }
            }
            ToolbarItemGroup(placement: .topBarLeading){
                Button("Save"){
                    let grocery = Groceries(name: name, emoji: emoji, remarks: remarks, quantity: quantity)
                    modelContext.insert(grocery)
                    dismiss()
                }
            }
        }
        
    }
}

#Preview {
        NewGrocery()
    }
