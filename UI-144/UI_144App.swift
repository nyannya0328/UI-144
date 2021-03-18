//
//  UI_144App.swift
//  UI-144
//
//  Created by にゃんにゃん丸 on 2021/03/14.
//

import SwiftUI

@main
struct UI_144App: App {
    @StateObject var model = MenuViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
