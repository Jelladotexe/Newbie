//
//  Groceries.swift
//  Groceries
//
//  Created by admin on 3/11/24.
//

import Foundation
import SwiftData

@Model
class Groceries
{
    var name: String
    var emoji: String
    var remarks: String
    var quantity: Int
    
    init(name: String, emoji: String, remarks: String, quantity: Int)
    {
        self.name = name
        self.emoji = emoji
        self.remarks = remarks
        self.quantity = quantity
    }
}
