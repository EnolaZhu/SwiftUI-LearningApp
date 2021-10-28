//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Enola Zhu on 2021/10/28.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
