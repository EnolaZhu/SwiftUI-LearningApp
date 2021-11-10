//
//  ContentModel.swift
//  LearningApp
//
//  Created by Enola Zhu on 2021/10/28.
//

import Foundation
class ContentModel: ObservableObject {
    // List of modules
    @Published var modules = [Module]()
    // Current module
    @Published var currentModule:Module?
    var currentModuleIndex = 0
    // Current lesson
    @Published var currentLesson: Lesson?
    // Curent lesson discription
    @Published var lessonDiscription = NSAttributedString()
    var currentLessonIndex = 0
    var styleData:Data?
    // Current selected content and test
    @Published var currentContentSelected:Int?
    init() {
        getLocalData()
    }
    // MARK: - Data
    func getLocalData() {
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            self.modules = modules
        }
        catch {
            print("Couldn't parse local data")
        }
        // Parse the style data
        let styleData = Bundle.main.url(forResource: "style", withExtension: "html")
        do {
            let styleData = try Data(contentsOf: styleData!)
            self.styleData = styleData
        }
        catch {
            print("Couldn't parse style data")
        }
    }
    // MARK: - Module navigation
    func beginModule(_ moduleid:Int) {
        for index in 0..<modules.count {
            if modules[index].id == moduleid {
               currentModuleIndex = index
            }
            break
        }
        currentModule = modules[currentModuleIndex]
    }
    func beginLesson(_ lessonIndex:Int) {
        if lessonIndex < currentModule!.content.lessons.count {
            currentLessonIndex = lessonIndex
        }
        else {
            currentLessonIndex = 0
        }
        currentLesson = currentModule?.content.lessons[currentLessonIndex]
        lessonDiscription = addStyling(currentLesson!.explanation)
    }
    func nextLesson() {
        currentLessonIndex += 1
        if currentLessonIndex < currentModule!.content.lessons.count {
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            lessonDiscription = addStyling(currentLesson!.explanation)
        }
        else {
            // Reset
            currentLessonIndex = 0
            currentLesson = nil
        }
    }
    func hasNextLesson() -> Bool {
        return (currentLessonIndex + 1 < currentModule!.content.lessons.count)
    }
    // Turn html string into attributed string
    private func addStyling(_ htmlString: String) -> NSAttributedString {
        var resultString = NSAttributedString()
        var data = Data()
        // Add the styling data
        if styleData != nil {
            data.append(styleData!)
        }
        // Add the html data
        data.append(Data(htmlString.utf8))
        // Convert to attributed string
            if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
                resultString = attributedString
        }
        return resultString
    }
}
