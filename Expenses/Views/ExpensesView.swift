//
//  ExpensesView.swift
//  Expenses
//
//  Created by Matias Amaya on 12/2/23.
//

import SwiftUI
import SwiftData

struct ExpensesView: View {
    
    
    @Binding var currentTab: String
    
 
    
    var body: some View {
        
        NavigationStack{
            ScreenshotPreventView{
                GeometryReader {
                    let size = $0.size
                    
                    ListCategoriesView(currentTab: $currentTab)

                }
            }
            .navigationTitle("Expenses")
        }
       
        }
      
    }
    

#Preview {
    ContentView()
}
