//
//  PhoneNumberView.swift
//  Homework
//
//  Created by Vahagn Madoyan on 08.07.24.
//

import SwiftUI

struct PhoneNumberView: View {
    let number: String

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Image("ic_mail")
                .frame(width: 40, height: 40)
            Text(number)
                .font(.montserratBold(24))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    PhoneNumberView(number: "+7 (921) 233-123-44")
}
