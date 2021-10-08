//
//  LanguagesModel.swift
//  SwiftUISample
//
//  Created by Ömer Can Koç on 8.10.2021.
//

import Foundation

struct LanguageType : Identifiable {
    var id = UUID()
    var title : String
    var languageType : [LanguageModel]
    
}

struct LanguageModel : Identifiable {
    var id = UUID()
    var language : String
    var image : String
    var description : String
}

let rust = LanguageModel(language: "Rust", image: "rust", description: "Compiled")
let kotlin = LanguageModel(language: "Kotlin", image: "kotlin", description: "Compiled")
let swift = LanguageModel(language: "Swift", image: "swift", description: "Compiled")
let javascript = LanguageModel(language: "JavaScript", image: "javascript", description: "Interpreted")
let python = LanguageModel(language: "Python", image: "python", description: "Interpreted")
let ruby = LanguageModel(language: "Ruby", image: "ruby", description: "Interpreted")

let compiled = LanguageType(title: "Compiled", languageType: [rust,kotlin,swift])
let interpreted = LanguageType(title: "Interpreted", languageType: [javascript,python,ruby])

let languages = [compiled,interpreted]

