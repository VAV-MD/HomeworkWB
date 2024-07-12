//
//  OTPTextView.swift
//  Homework
//
//  Created by Vahagn Madoyan on 05.07.24.
//

import SwiftUI

struct OTPTextView: View {
    @State private var verificationCode = ""

    @FocusState var focusField: FocusField?
    @Binding var textFieldState: TextState
    @Binding var isAllNumbersFilled: Bool
    let pinLength: Int
    let keyboardType: UIKeyboardType
    let onComplete: (String) -> ()

    var body: some View {
        VStack {
            ZStack(alignment: .center) {
                OTPTextFiield(
                    keyboardFocusField: _focusField,
                    verificationCode: $verificationCode,
                    pinLength: pinLength,
                    keyboardType: keyboardType,
                    onComplete: {
                        isAllNumbersFilled = true
                        onComplete(verificationCode)
                    },
                    textChanged: {
                        withAnimation(.easeInOut) {
                            textFieldState = .neutral
                        }
                        isAllNumbersFilled = false
                    }
                )
                HStack(alignment: .center, content: {
                    ForEach(0..<pinLength, id: \.self) { i in
                        Spacer()
                        OTPCodeView(text: getPin(at: i), state: textFieldState)
                        Spacer()
                    }
                })
            }
            .padding(.bottom, 12)
            if textFieldState == .error {
                Text("Неверный пароль")
                    .font(.montserratRegular(12))
                    .foregroundStyle(.textFieldErrorBorder)
                    .padding(.horizontal, 16)
            }
        }
        .onTapGesture {
            focusField = .selected
        }
        .frame(maxWidth: .infinity)
    }

    func getPin(at index: Int) -> String {
        guard self.verificationCode.count > index else {
            return ""
        }
        let chars = Array(verificationCode)
        return String(chars[index])
    }
}
