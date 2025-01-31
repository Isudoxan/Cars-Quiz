//
//  QuizProvider.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 30.01.2025.
//

class Quiz {
    
    enum QuizType {
        case carsHero
        case homophonesHero
    }
    
    let type: QuizType
    let title: String
    var image: String
    
    init(type: QuizType, title: String, image: String) {
        self.type = type
        self.title = title
        self.image = image
    }
}

class QuizProvider {
    static let quizes = [
        Quiz(type: .carsHero, title: "Cars Hero 🚘", image: "CarsQuizLogo"),
        Quiz(type: .homophonesHero, title: "Homophones Hero 🗣️", image: "HomophonesQuizLogo"),
        Quiz(type: .carsHero, title: "Cars Hero 🚘", image: "CarsQuizLogo"),
        Quiz(type: .homophonesHero, title: "Homophones Hero 🗣️", image: "HomophonesQuizLogo")
    ]
}
