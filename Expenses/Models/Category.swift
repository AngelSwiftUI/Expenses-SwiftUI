//
//  Category.swift
//  Expenses
//
//  Created by Matias Amaya on 12/2/23.
//

import SwiftUI
import SwiftData

@Model
class Category {
    var categoryName: String
    
    @Relationship(deleteRule: .cascade, inverse: \Expense.category)
    var expenses: [Expense]?
    
    init(categoryName: String) {
        self.categoryName = categoryName
    }
}
