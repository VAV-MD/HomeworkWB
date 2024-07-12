//
//  LoginView.swift
//  Homework
//
//  Created by Vahagn Madoyan on 09.07.24.
//

import SwiftUI

struct LoginView: View {
    @State private var isLoading: Bool = false
    @State private var isAllNumbersFilled: Bool = false
    @State private var textFieldState: TextState = .neutral
    @State private var phoneNumber: String = ""
    @FocusState private var focusField: FocusField?
    @State private var path = NavigationPath()
    private let maskPhone = "+7 (XXX) XXX - XX - XX"
    
    var body: some View {
        NavigationStack(path: $path, root: {
            ZStack {
                BackgroundView()
                CustomContentView(isLoading: isLoading) {
                    LoginHeaderView()
                        .padding(.top, 40)
                    PhoneNumberInputContainerView(
                        isAllNumbersFilled: $isAllNumbersFilled,
                        textFieldState: $textFieldState,
                        onComplete: { value in
                            phoneNumber = value
                        })
                    .padding(.top, 32)
                    .padding(.horizontal, 24)
                    PrimaryButton(
                        text: "Запросить код",
                        isDisabled: !isAllNumbersFilled) {
                            focusField = nil
                            withAnimation(.easeInOut) {
                                isLoading = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation(.easeInOut) {
                                    isLoading = false
                                    textFieldState = phoneNumber == "5555555555" ? .error : .success
                                }
                                path.append(phoneNumber)
                            }
                        }
                        .padding(.bottom, 44)
                        .padding([.horizontal, .top], 24)
                }
                .padding()
                .hideKeyboardOnTap()
            }
            .navigationDestination(for: String.self) { number in
                OTPView(phoneNumber: number.format(with: maskPhone))
            }
        })
    }
}

#Preview {
    LoginView()
}
