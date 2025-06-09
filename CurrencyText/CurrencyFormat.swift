//
//  CurrencyFormat.swift
//  CurrencyText
//
//  Created by Sheraz Ahmed on 09/06/2025.
//



enum CurrencyFormat: String, CaseIterable {
    case symbolBefore = "SymbolBefore"
    case symbolAfter = "SymbolAfter"
    case codeBefore = "CodeBefore"
    case codeAfter = "CodeAfter"
    
    var pattern: String {
        switch self {
        case .symbolBefore:
            return "$ 1,234.00"
        case .symbolAfter:
            return "1,234.00 $"
        case .codeBefore:
            return "USD 1,234.00"
        case .codeAfter:
            return "1,234.00 USD"
        }
    }
}

