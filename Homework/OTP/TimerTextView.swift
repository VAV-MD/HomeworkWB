//
//  TimerTextView.swift
//  Homework
//
//  Created by Vahagn Madoyan on 08.07.24.
//

import SwiftUI

struct TimerTextView: View {
    @Binding var timeRemaining: Int
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let didTapButton: () -> ()

    var body: some View {
        Button(action: {
            didTapButton()
        }, label: {
            Text(timeRemaining == 0 ? "Запросить код снова" : "Запросить повторно через \(timeRemaining) сек")
                .font(.montserratRegular(14))
                .foregroundColor(.white)
                .onReceive(timer) { _ in
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                    }
                }
                .underline(timeRemaining == 0)
        })
        .disabled(timeRemaining > 0)
    }
}
