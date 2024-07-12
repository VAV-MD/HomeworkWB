//
//  LoginHeaderView.swift
//  Homework
//
//  Created by Vahagn Madoyan on 11.07.24.
//

import SwiftUI

struct LoginHeaderView: View {
    var body: some View {
        VStack {
            Text("Авторизация")
                .font(.montserratBold(24))
                .foregroundColor(.white)
                .padding(.bottom, 28)
            Image("avatar_image")
                .frame(width: 96, height: 96)
                .clipShape(.circle)
                .padding(.bottom, 16)
            Text("Вход по номеру телефона")
                .font(.montserratRegular(16))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    LoginHeaderView()
}
