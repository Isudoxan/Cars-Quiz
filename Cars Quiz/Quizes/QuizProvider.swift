//
//  QuizProvider.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 30.01.2025.
//

class Quiz {
    let title: String
    var image: String
    
    init(title: String, image: String) {
        self.title = title
        self.image = image
    }
}

class QuizProvider {
    static let quizes = [
        Quiz(title: "Cars Hero 🚘", image: "CarsQuizLogo"),
        Quiz(title: "Homophones Hero 🗣️", image: "HomophonesQuizLogo"),
        Quiz(title: "Cars Hero 🚘", image: "CarsQuizLogo"),
        Quiz(title: "Homophones Hero 🗣️", image: "HomophonesQuizLogo")
        
    ]
}
