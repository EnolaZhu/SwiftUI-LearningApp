//
//  ContentModel.swift
//  LearningApp
//
//  Created by Enola Zhu on 2021/10/28.
//

import Foundation
class ContentModel: ObservableObject {
    @Published var modules = [Module]()
    var styleData:Data?
    init() {
        getLocalData()
    }
    // Parse Json data
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
}
