//
//  OTPView.swift
//  Homework
//
//  Created by Vahagn Madoyan on 05.07.24.
//

import SwiftUI

struct OTPView: View {
    @State private var isAllNumbersFilled: Bool = false
    @State private var textFieldState: TextState = .neutral
    @State private var verificationCode: String = ""
    @State private var isLoading: Bool = false
    @State private var timeRemaining = 10
    @FocusState private var focusField: FocusField?
    private let pinLength: Int = 4
    private let keyboardType: UIKeyboardType = .numberPad

    let phoneNumber: String

    var body: some View {
        ZStack {
            BackgroundView()
            CustomContentView(isLoading: isLoading, content: {
                PhoneNumberView(number: phoneNumber)
                    .padding(.top, 40)
                OTPTextView(
                    focusField: _focusField,
                    textFieldState: $textFieldState,
                    isAllNumbersFilled: $isAllNumbersFilled,
                    pinLength: pinLength,
                    keyboardType: keyboardType
                )
                { value in
                    verificationCode = value
                    print(value)
                }
                .padding(.top, 24)
                .padding(.bottom, 45)
                TimerTextView(timeRemaining: $timeRemaining,
                              didTapButton: {
                    withAnimation(.easeInOut) {
                        isLoading = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation(.easeInOut) {
                            isLoading = false
                        }
                        timeRemaining = 10
                    }
                })
                PrimaryButton(
                    text: "Авторизоваться",
                    isDisabled: !isAllNumbersFilled,
                    didTapButton: {
                        focusField = nil
                        withAnimation(.easeInOut) {
                            isLoading = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation(.easeInOut) {
                                isLoading = false
                                textFieldState = verificationCode == "1234" ? .error : .success
                            }
                        }
                    }
                )
                .padding(.bottom, 48)
                .padding([.horizontal, .top], 24)
            })
            .padding()
            .hideKeyboardOnTap()
        }
    }
}

#Preview {
    OTPView(
        phoneNumber: "+7 (921) 233-123-44"
    )
}
