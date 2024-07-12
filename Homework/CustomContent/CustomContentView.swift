//
//  CustomContentView.swift
//  Homework
//
//  Created by Vahagn Madoyan on 09.07.24.
//

import SwiftUI

struct CustomContentView<Content> : View where Content : View {
    let isLoading: Bool
    @ViewBuilder var content: Content

    var body: some View {
        ZStack {
            VStack(content: {
                content
                    .opacity(isLoading ? 0 : 1)

            })
            .frame(maxWidth: 400)
            .background(
                LinearGradient(
                    colors: [.backgroundStart.opacity(94), .backgroundEnd.opacity(49)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 28))
            .disabled(isLoading)
            if isLoading {
                LoadingView()
            }
        }
    }
}
