//
//  OTPTextFiield.swift
//  Homework
//
//  Created by Vahagn Madoyan on 05.07.24.
//

import SwiftUI
import Combine

struct OTPTextFiield: View {
    @FocusState var keyboardFocusField: FocusField?
    @Binding var verificationCode: String
    @State var isAllNumbersFilled: Bool = false

    private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    let pinLength: Int
    let keyboardType: UIKeyboardType
    var onComplete: () -> ()
    var textChanged: () -> ()

    var body: some View {
        ZStack {
            TextField("", text: $verificationCode)
                .frame(width: 0, height: 0, alignment: .center)
                .font(.system(size: 0))
                .tint(.clear)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .keyboardType(keyboardType)
                .focused($keyboardFocusField, equals: .selected)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            keyboardFocusField = nil
                        }
                    }
                }
                .padding()
                .task {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.keyboardFocusField = .selected
                    }
                }
                .onReceive(Just(verificationCode), perform: { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        verificationCode = filtered
                    }

                    if verificationCode.count > pinLength {
                        verificationCode = String(verificationCode.prefix(pinLength))
                    }

                    if verificationCode.count == pinLength && !isAllNumbersFilled {
                        onComplete()
                    } else if verificationCode.count < pinLength {
                        isAllNumbersFilled = false
                        textChanged()
                    }
                })
        }
    }
}

enum FocusField: Hashable {
    case selected
}
