//
//  SnapSpireApp.swift
//  SnapSpire
//
//  Created by Vlad Stanescu on 28.02.2023.
//

import SwiftUI

@main
struct SnapSpireApp: App {
    @State var isShowingSplash: Bool = true

    var body: some Scene {
        WindowGroup {
            if isShowingSplash {
                SplashView(isShowingSplash: $isShowingSplash)
            } else {
                ContentView()
            }
        }
    }
}
