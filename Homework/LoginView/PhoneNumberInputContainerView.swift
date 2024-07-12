//
//  PhoneNumberInputContainerView.swift
//  Homework
//
//  Created by Vahagn Madoyan on 11.07.24.
//

import SwiftUI

struct PhoneNumberInputContainerView: View {
    @State var mobPhoneNumber: String = ""
    @Binding var isAllNumbersFilled: Bool
    @Binding var textFieldState: TextState
    @FocusState var keyboardFocusField: FocusField?

    let onComplete: (String) -> ()

    private var borderColor: Color {
        switch textFieldState {
        case .neutral: .clear
        case .success: .textFieldSuccessBorder
        case .error: .textFieldErrorBorder
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            if textFieldState == .error {
                Text("Некорректный формат номера")
                    .font(.montserratRegular(12))
                    .foregroundStyle(.textFieldErrorBorder)
                    .padding(.horizontal, 16)
                    .padding(.top, 2)
            }
            HStack {
                PhoneNumberInputView(
                    mobPhoneNumber: $mobPhoneNumber,
                    isAllNumbersFilled: $isAllNumbersFilled,
                    textFieldState: $textFieldState,
                    keyboardFocusField: _keyboardFocusField)
                { value in
                    onComplete(value)
                }
                .padding(.horizontal, 16)
                Spacer()
                if keyboardFocusField == .selected &&
                    !mobPhoneNumber.isEmpty {
                    Button(action: {
                        mobPhoneNumber = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .tint(.white)
                    }
                    .frame(width: 20, height: 20)
                    .padding(.horizontal, 12)
                }
            }
        })
        .frame(maxWidth: .infinity)
        .frame(height: 48)
        .background(.textFieldBackground)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(borderColor, lineWidth: 1)
        )
        .onTapGesture {
            keyboardFocusField = .selected
        }
    }
}

#Preview {
    PhoneNumberInputContainerView(
        isAllNumbersFilled: .constant(false),
        textFieldState: .constant(.neutral)
    ) {_ in }
}
