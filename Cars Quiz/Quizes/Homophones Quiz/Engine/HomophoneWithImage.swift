//
//  HomophoneWithImage.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 03.02.2025.
//

import UIKit

/// Composition pattern.
class HomophoneWithImage {
    let homophone: Homophon
    let firstWordImage: UIImage?
    let secondWordImage: UIImage?
    
    var firstWordEN: String {
        return homophone.firstWordEN
    }
    
    var secondWordEN: String {
        return homophone.secondWordEN
    }
    
    var firstWordUA: String {
        return homophone.firstWordUA
    }
    
    var secondWordUA: String {
        return homophone.secondWordUA
    }
    
    var wordTranscription: String {
        return homophone.wordTranscription
    }
    
    var firstSentence: String {
        return homophone.firstSentence
    }
    
    var secondSentence: String {
        return homophone.secondSentence
    }
    
    init(homophone: Homophon, firstWordImage: UIImage?, secondWordImage: UIImage?) {
        self.homophone = homophone
        self.firstWordImage = firstWordImage
        self.secondWordImage = secondWordImage
    }
}
