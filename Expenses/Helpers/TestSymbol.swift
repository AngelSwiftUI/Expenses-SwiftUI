//
//  TestSymbol.swift
//  Expenses
//
//  Created by Matias Amaya on 12/3/23.
//

import SwiftUI

struct TestSymbol: View {
    
    @State private var animateSymbol: Bool = false
    
    var body: some View {
       Image(systemName: "suit.heart.fill")
            .font(.largeTitle)
            .tint(.red)
            .symbolEffect(.pulse, options: .repeating, value: animateSymbol)
            .onTapGesture {
                animateSymbol.toggle()
            }
    }
}

#Preview {
    TestSymbol()
}
