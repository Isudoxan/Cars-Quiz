//
//  QuizStyleProvider.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 31.01.2025.
//

import UIKit

class QuizStyle {
    let titleColor: UIColor
    
    init(titleColor: UIColor) {
        self.titleColor = titleColor
    }
}

class StyledQuiz {
    let quiz: Quiz
    let style: QuizStyle
    
    init(quiz: Quiz, style: QuizStyle) {
        self.quiz = quiz
        self.style = style
    }
}

///
/// Decorator (Adapter) from quizes to styled quizes.
/// 
class StyledQuizProvider {
    static let styledQuizes = {
        let quizes = QuizProvider.quizes
        
        let styledQuizes = quizes.map { quiz in
            
            let quizStyle: QuizStyle
            
            switch quiz.type {
            case .carsHero:
                quizStyle = QuizStyle(titleColor: .white)
            case .homophonesHero:
                quizStyle = QuizStyle(titleColor: .black)
            }
            
            return StyledQuiz(quiz: quiz, style: quizStyle)
        }
        
        return styledQuizes
    }()
}
