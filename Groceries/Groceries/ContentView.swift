//
//  ContentView.swift
//  Groceries
//
//  Created by admin on 3/11/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContect
    @Query var groceries: [Groceries]
    
    @State private var isShowingAddGrocery = false
    @State private var isShowingEditGrocery = false
    
    @State private var selectedGrocery: Groceries?
    
    var body: some View{
        NavigationStack{
            List(groceries) { grocery in
                HStack(spacing: 12){
                    Text(grocery.emoji)
                        .font(.title)
                    VStack(alignment: .leading){
                        Text(grocery.name)
                            .font(.headline)
                        Text(grocery.remarks)
                            .font(.subheadline)
                    }
                    Spacer()
                    Text("\(grocery.quantity)")
                        .font(.headline)
                }
                .swipeActions(allowsFullSwipe: false){
                    Button(role: .destructive){
                        modelContect.delete(grocery)
                    } label: {
                        Text("Delete")
                    }
                }
            }
            .navigationTitle("Groceries")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                ToolbarItemGroup(placement: .topBarTrailing){
                    Button("Add Grocery", systemImage: "plus.circle.fill"){
                        isShowingAddGrocery.toggle()    
                    }
                }
            }
            .sheet(isPresented: $isShowingAddGrocery) {
                NewGrocery()
            }
        }
    }
}

#Preview {
    ContentView()
}
