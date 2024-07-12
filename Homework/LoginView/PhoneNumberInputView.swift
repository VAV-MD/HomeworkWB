//
//  PhoneNumberInputView.swift
//  Homework
//
//  Created by Vahagn Madoyan on 10.07.24.
//

import SwiftUI
import Combine

struct PhoneNumberInputView: View {
    @Binding var mobPhoneNumber: String
    @State var mobPhoneNumberWithMask: String = "+7 (|___) ___ - __ - __"
    @Binding var isAllNumbersFilled: Bool
    @Binding var textFieldState: TextState
    @FocusState var keyboardFocusField: FocusField?

    let onComplete: (String) -> ()

    private let maskPhone = "+7 (XXX) XXX - XX - XX"
    private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    var body: some View {
        ZStack {
            OTPTextFiield(
                keyboardFocusField: _keyboardFocusField,
                verificationCode: $mobPhoneNumber,
                pinLength: 10,
                keyboardType: .numberPad,
                onComplete: {
                    isAllNumbersFilled = true
                    onComplete(mobPhoneNumber)
                },
                textChanged: {
                    withAnimation(.easeIn(duration: 0.3)) {
                        textFieldState = .neutral
                        isAllNumbersFilled = false
                    }
                }
            )
            .onChange(of: mobPhoneNumber) { newValue in
                mobPhoneNumberWithMask = format(with: maskPhone, text: newValue)
            }
            Text(keyboardFocusField == .selected ? mobPhoneNumberWithMask : mobPhoneNumberWithMask.replacing("|", with: ""))
                .font(.montserratMedium(16))
                .foregroundColor(.white)
        }
    }

    func getPin(at index: Int) -> String {
        guard self.mobPhoneNumber.count > index else {
            return ""
        }
        let chars = Array(mobPhoneNumber)
        return String(chars[index])
    }
    
    private func format(with mask: String, text: String) -> String {
        var result = text.format(with: mask)
        guard let lineIndex = result.firstIndex(where: { $0 == "_"}) else {
            return result + "|"
        }
        result.insert("|", at: lineIndex)
        return result
    }
}

#Preview {
    PhoneNumberInputView(
        mobPhoneNumber: .constant(""),
        mobPhoneNumberWithMask: "+7 (|___) ___ - __ - __",
        isAllNumbersFilled: .constant(false),
        textFieldState: .constant(.neutral)
    ) { _ in

    }
}

extension Collection where Indices.Iterator.Element == Index {
    subscript (exist index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
