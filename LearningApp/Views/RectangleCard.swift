//
//  RectangleCard.swift
//  LearningApp
//
//  Created by Enola Zhu on 2021/11/10.
//

import SwiftUI

struct RectangleCard: View {
    // Make the color dynamic
    var color = Color.white
    
    var body: some View {
        Rectangle()
            .frame(height: 48)
            .foregroundColor(color)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}


