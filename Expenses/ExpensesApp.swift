//
//  ExpensesApp.swift
//  Expenses
//
//  Created by Matias Amaya on 12/2/23.
//

import SwiftUI

@main
struct ExpensesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Expense.self, Category.self])
    }
}
