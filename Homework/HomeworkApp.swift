//
//  HomeworkApp.swift
//  Homework
//
//  Created by Vahagn Madoyan on 05.07.24.
//

import SwiftUI

@main
struct HomeworkApp: App {
    @State var path = NavigationPath()
    @State private var phoneNumber: String = ""

    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
