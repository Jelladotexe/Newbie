//
//  EditGrocery.swift
//  Groceries
//
//  Created by admin on 3/11/24.
//

import SwiftUI
import SwiftData

struct EditGrocery: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @Bindable var grocery: Groceries
    let emojis = ["🍣", "🍙", "🍜", "🍡"]
    
    var body: some View{
        NavigationStack{
            Form{
                Picker("Emoji", selection: $grocery.emoji){
                    ForEach(emojis, id:\.self) {emoji in Text(emoji)}
                }
                TextField("Name", text: $grocery.name)
                TextField("Remarks", text: $grocery.remarks, axis: .vertical)
                    .lineLimit(4)
                Stepper("Quuantity: \(grocery.quantity)", value: $grocery.quantity)
            }
            
        }
        .navigationTitle("Edit\(grocery.name)")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Groceries.self, configurations: config)
        
        let example = Groceries(name: "ramen", emoji: "🍜", remarks: "Japanese Ramen", quantity: 1)
        
        container.mainContext.insert(example)
        
        return EditGrocery(grocery: example)
    }catch{
        fatalError("Failed to create model container.")
    }
}
