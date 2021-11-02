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
    var currentLessonIndex = 0
    var styleData:Data?
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
    }
}
