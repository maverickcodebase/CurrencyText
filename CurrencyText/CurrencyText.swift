//
//  CurrencyText.swift
//  CurrencyText
//
//  Created by Sheraz Ahmed on 09/06/2025.
//



import SwiftUI



struct CurrencyText: View {
    var amount: Double
    var currencyFormat: CurrencyFormat? = .symbolBefore // Optional format
    
    var body: some View {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current

        // Use local currency info
        let currencySymbol = formatter.currencySymbol ?? ""
        let currencyCode = formatter.currencyCode ?? ""

        // Apply custom format if provided
        switch currencyFormat {
        case .symbolBefore:
            formatter.positiveFormat = "¤ #,##0.##"
            formatter.negativeFormat = "-¤ #,##0.##"
        case .symbolAfter:
            formatter.positiveFormat = "#,##0.## ¤"
            formatter.negativeFormat = "-#,##0.## ¤"
        case .codeBefore:
            formatter.positiveFormat = "¤¤ #,##0.##"
            formatter.negativeFormat = "-¤¤ #,##0.##"
        case .codeAfter:
            formatter.positiveFormat = "#,##0.## ¤¤"
            formatter.negativeFormat = "-#,##0.## ¤¤"
        case .none:
            break // Use default locale formatting
        }

        let formattedString = formatter.string(from: NSNumber(value: amount)) ?? "\(amount)"
        let attributedString = NSMutableAttributedString(string: formattedString)

        // Highlight currency symbol
        if let symbolRange = formattedString.range(of: currencySymbol) {
            let nsRange = NSRange(symbolRange, in: formattedString)
            attributedString.addAttribute(.foregroundColor, value: UIColor(Color(.placeholderText)), range: nsRange)
            attributedString.addAttribute(.font, value: UIFont.preferredFont(forTextStyle: .body), range: nsRange)
        }

        // Highlight currency code
        if let codeRange = formattedString.range(of: currencyCode) {
            let nsRange = NSRange(codeRange, in: formattedString)
            attributedString.addAttribute(.foregroundColor, value: UIColor(Color(.placeholderText)), range: nsRange)
            attributedString.addAttribute(.font, value: UIFont.preferredFont(forTextStyle: .body), range: nsRange)
        }

        return Text(AttributedString(attributedString))
    }
}

#Preview {
    VStack(spacing: 16) {
        CurrencyText(amount: 1234.56, currencyFormat: .symbolBefore)
        CurrencyText(amount: 1234.56, currencyFormat: .symbolAfter)
        CurrencyText(amount: 1234.56, currencyFormat: .codeBefore)
        CurrencyText(amount: 1234.56, currencyFormat: .codeAfter)
    }
    .font(.title)
    .padding()
}
