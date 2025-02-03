//
//  HomophonesProvider.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 03.02.2025.
//

import UIKit

class HomophonesProvider{
        
    class Homophon {
//      ua - means "Ukrainian"
        let firstWord: String
        let secondWord: String
        let uaFirstWord: String
        let uaSecondWord: String
        let wordTranscription: String
        let firstSentense: String
        let secondSentense: String
        
        init(firstWord: String, secondWord: String, uaFirstWord: String, uaSecondWord: String, wordTranscription: String, firstSentense: String, secondSentense: String)
        
        {
            self.firstWord = firstWord
            self.secondWord = secondWord
            self.uaFirstWord = uaFirstWord
            self.uaSecondWord = uaSecondWord
            self.wordTranscription = wordTranscription
            self.firstSentense = firstSentense
            self.secondSentense = secondSentense
        }
    }
    
    var homophones: [Homophon] = [
        Homophon(firstWord: "Write", secondWord: "Right", uaFirstWord: "Писати", uaSecondWord: "Правий", wordTranscription: "[rait]", firstSentense: "1. Turn ... at the crossroads.", secondSentense: "2. Please ... in black ink."),
        Homophon(firstWord: "Root", secondWord: "Route", uaFirstWord: "Корінь", uaSecondWord: "Маршрут", wordTranscription: "[ru:t]", firstSentense: "1. I drive this ... every day.", secondSentense: "2. He took hold of the plant's ... and pulled."),
        Homophon(firstWord: "Wine", secondWord: "Whine", uaFirstWord: "Вино", uaSecondWord: "Скиглити", wordTranscription: "[wain]", firstSentense: "1. Alice, if you keep ... i won't take you - do you understand?", secondSentense: "2. Let's have glass of ... with dinner."),
        Homophon(firstWord: "Wait", secondWord: "Weight", uaFirstWord: "Чекати", uaSecondWord: "Вага", wordTranscription: "[weit]", firstSentense: "1. My ... reduces when i stop eating sugar.", secondSentense: "2. The children were hungry and could hardly ... for their father to come."),
        Homophon(firstWord: "Weak", secondWord: "Week", uaFirstWord: "Слабкий", uaSecondWord: "Тиждень", wordTranscription: "[wi:k]", firstSentense: "1. 'You're too ... to fight him,' she said.", secondSentense: "2. We're usually too tired to go out much during the ... ."),
        Homophon(firstWord: "Bawl", secondWord: "Ball", uaFirstWord: "Кричати", uaSecondWord: "М'яч", wordTranscription: "bo:l", firstSentense: "1. Don't ... out like that: i can hear you.", secondSentense: "2. Just try to concentrate on hitting the ... ."),
        Homophon(firstWord: "Hole", secondWord: "Whole", uaFirstWord: "Дірка", uaSecondWord: "Весь, цілий", wordTranscription: "[hoʊl]", firstSentense: "1. I spent the ... day cleaning.", secondSentense: "2. My jumper's got a ... in it."),
        Homophon(firstWord: "Hear", secondWord: "Here", uaFirstWord: "Чути", uaSecondWord: "Тут", wordTranscription: "[hir]", firstSentense: "1. You'll have to speak up, i can't ... you.", secondSentense: "2. London is only 50 miles from ... ."),
        Homophon(firstWord: "Prey", secondWord: "Pray", uaFirstWord: "Здобич", uaSecondWord: "Молитися", wordTranscription: "[prei]", firstSentense: "1. Most snakes swallow their ... whole.", secondSentense: "2. Let us ... for the victims of this terrible disaster."),
        Homophon(firstWord: "Chilly", secondWord: "Chilli", uaFirstWord: "Холодний", uaSecondWord: "Гострий перець", wordTranscription: "[tʃili]", firstSentense: "1. Beware the ... if you don't like spicy food.", secondSentense: "2. I felt a bit ... so i put on a jacket"),
    ]
    
}
