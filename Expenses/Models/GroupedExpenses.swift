//
//  GroupedExpenses.swift
//  Expenses
//
//  Created by Matias Amaya on 12/2/23.
//

import SwiftUI
 
struct GroupedExpenses: Identifiable {
    var id: UUID = .init()
    var date: Date
    var expenses: [Expense]
    
    var groupTitle: String {
        let calendar = Calendar.current
        
        if calendar.isDateInToday(date) {
            return "Today"
        } else if calendar.isDateInYesterday(date) {
            return "Yesteday"
        } else {
            return date.formatted(date: .abbreviated, time: .omitted)
        }
    }
    
}
