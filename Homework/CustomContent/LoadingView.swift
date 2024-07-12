//
//  LoadingView.swift
//  Homework
//
//  Created by Vahagn Madoyan on 09.07.24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .buttonBackground))
                .scaleEffect(2.0, anchor: .center)
        }
    }
}

#Preview {
    LoadingView()
}
