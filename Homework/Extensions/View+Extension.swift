//
//  View+Extension.swift
//  Homework
//
//  Created by Vahagn Madoyan on 12.07.24.
//

import SwiftUI

extension View {
    func hideKeyboardOnTap() -> some View {
        ModifiedContent(content: self, modifier: HideKeyboardOnTapModifier())
    }
}

private struct HideKeyboardOnTapModifier: ViewModifier {
    static func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }

    func body(content: Content) -> some View {
        ZStack{
            Rectangle()
                .fill(Color.clear)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {}
                .onLongPressGesture(pressing: { isPressed in
                    if isPressed {
                        Self.hideKeyboard()
                    }
                },
                perform: {})
            content
        }
    }
}
