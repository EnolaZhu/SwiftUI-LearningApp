//
//  CodeTextView.swift
//  LearningApp
//
//  Created by Enola Zhu on 2021/11/4.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {
    @EnvironmentObject var model: ContentModel
    func makeUIView(context: Context) -> UITextView {
        // Creat and configure uikit object
        let textView = UITextView()
        textView.isEditable = false
        return textView
    }
    func updateUIView(_ textView: UITextView, context: Context) {
        // Set the attributed text for the lesson
        textView.attributedText = model.lessonDiscription
        // Scroll back to the top
        textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
    }
}

struct CodeTextView_Previews: PreviewProvider {
    static var previews: some View {
        CodeTextView()
    }
}
