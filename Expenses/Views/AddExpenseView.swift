//
//  AddExpenseView.swift
//  Expenses
//
//  Created by Matias Amaya on 12/2/23.
//

import SwiftUI
import SwiftData

struct AddExpenseView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var title: String = ""
    @State private var subtitle: String = ""
    @State private var date: Date = .init()
    @State private var amount: CGFloat = 0
    @State private var category: Category?
    @Query(animation: .snappy) private var allCategories: [Category]
    
    
    var body: some View {
        NavigationStack{
            
            List{
                Section("Title") {
                    TextField("Groceries", text: $title)
                }
                
                Section("Description") {
                    TextField("Food for the month", text: $subtitle)
                }
                
              
                Section("Amount Spent") {
                    HStack(spacing: 4) {
                        Text("$")
                            .fontWeight(.semibold)
                        TextField("0.0", value: $amount, formatter: formatter)
                            .keyboardType(.numberPad)
                    }
                }
                        
                        Section{
                            if !allCategories.isEmpty {
                                HStack{
                                    Text("Category")
                                    
                                    Spacer()
                                    
                                    Menu {
                                        ForEach(allCategories) { category in
                                            Button(category.categoryName) {
                                                self.category = category
                                            }
                                        }
                                        
                                        Button("None") {
                                            category = nil
                                        }
                                        
                                    } label: {
                                        if let categoryName = category?.categoryName {
                                            Text(categoryName)
                                        } else {
                                            Text("None")
                                        }
                                    }
                                    
                                }
                            }
                        }

                
                Section("Date") {
                    DatePicker("", selection: $date, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                }
                .tint(.purple)
                
               
                
            }
            .navigationTitle("Add expenses")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .tint(.red)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", action: addExpense)
                        .disabled(isAddButtonDisable)
                }
            }
        }
        
      
    }
    
    var isAddButtonDisable: Bool {
        return title.isEmpty || subtitle.isEmpty || amount == .zero
    }
    
    func addExpense() {
        let expense = Expense(title: title, subTitle: subtitle, amount: amount, date: date, category: category)
        context.insert(expense)
        dismiss()
    }
    
    var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }
}

#Preview {
    AddExpenseView()
}
