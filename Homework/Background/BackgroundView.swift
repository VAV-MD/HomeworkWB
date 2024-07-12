//
//  BackgroundView.swift
//  Homework
//
//  Created by Vahagn Madoyan on 08.07.24.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Image("background_image")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0, maxWidth: .infinity)
            .clipped()
            .edgesIgnoringSafeArea(.all)
            .background(.black)
    }
}

#Preview {
    BackgroundView()
}
