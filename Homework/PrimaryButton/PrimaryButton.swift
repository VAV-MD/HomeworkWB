//
//  PrimaryButton.swift
//  Homework
//
//  Created by Vahagn Madoyan on 08.07.24.
//

import SwiftUI

struct PrimaryButton: View {
    let text: String
    let isDisabled: Bool
    let didTapButton: () -> ()

    var body: some View {
        Button(action: {
            didTapButton()
        }, label: {
            Text(text)
                .font(.montserratMedium(16))
                .foregroundStyle(isDisabled ? .white.opacity(0.8) : .white)
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .background(isDisabled ? .buttonBackground.opacity(0.8) : .buttonBackground)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        })
        .disabled(isDisabled)
    }
}

#Preview {
    PrimaryButton(
        text: "Запросить код",
        isDisabled: false) {}
}
