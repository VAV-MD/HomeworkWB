//
//  OTPCodeView.swift
//  Homework
//
//  Created by Vahagn Madoyan on 05.07.24.
//

import SwiftUI

struct OTPCodeView: View {
    let text: String
    let state: TextState

    private var borderColor: Color {
        switch state {
        case .neutral: .clear
        case .success: .textFieldSuccessBorder
        case .error: .textFieldErrorBorder
        }
    }

    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 80)
                .frame(maxWidth: 60)
                .foregroundColor(.textFieldBackground)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(borderColor, lineWidth: 1)
                )
            Text(text)
                .font(.montserratSemiBold(36))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    OTPCodeView(text: "3", state: .success)
}

enum TextState {
    case neutral
    case success
    case error
}
