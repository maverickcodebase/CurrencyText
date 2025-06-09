//
//  ContentView.swift
//  CurrencyText
//
//  Created by Sheraz Ahmed on 09/06/2025.
//


import SwiftUI

struct ContentView: View {
    let amount: Double = 19
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Currency Format Previews")
                .font(.title2)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // SYMBOL BEFORE
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Symbol Before")
                }
                
                Spacer()
                
                CurrencyText(amount: amount, currencyFormat: .symbolBefore)
                    .font(.title)
                
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            
            // SYMBOL AFTER
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Symbol After") 
                }
                
                Spacer()
                
                CurrencyText(amount: amount, currencyFormat: .symbolAfter)
                    .font(.title)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            
            // CODE BEFORE
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Code Before")
                }
                
                Spacer()
                
                CurrencyText(amount: amount, currencyFormat: .codeBefore)
                    .font(.title)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            
            // CODE AFTER
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Code After")
                }
                
                Spacer()
                
                CurrencyText(amount: amount, currencyFormat: .codeAfter)
                    .font(.title)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
