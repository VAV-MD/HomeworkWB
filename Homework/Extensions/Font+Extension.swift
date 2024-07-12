//
//  Font+Extension.swift
//  Homework
//
//  Created by Vahagn Madoyan on 05.07.24.
//

import Foundation
import SwiftUI

extension Font {
    static func montserratRegular(_ size: CGFloat) -> Font {
        .custom("Montserrat-Regular", size: size)
    }

    static func montserratMedium(_ size: CGFloat) -> Font {
        .custom("Montserrat-Medium", size: size)
    }

    static func montserratSemiBold(_ size: CGFloat) -> Font {
        .custom("Montserrat-SemiBold", size: size)
    }

    static func montserratBold(_ size: CGFloat) -> Font {
        .custom("Montserrat-Bold", size: size)
    }
}
