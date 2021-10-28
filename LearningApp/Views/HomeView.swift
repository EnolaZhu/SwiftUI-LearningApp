//
//  ContentView.swift
//  LearningApp
//
//  Created by Enola Zhu on 2021/10/28.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model:ContentModel
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
