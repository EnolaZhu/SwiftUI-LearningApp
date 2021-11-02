//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Enola Zhu on 2021/11/1.
//

import SwiftUI
import AVKit
struct ContentDetailView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        VStack {
            // Video
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
                // Description
                
                // Show Next lesson button if there is a next lesson
                if model.hasNextLesson() == true { Button(action: {
                    model.nextLesson()
                }, label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 48)
                            .foregroundColor(Color.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                    }
                })
                }
            }
        }
        .padding()
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
