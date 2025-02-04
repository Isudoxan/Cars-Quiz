//
//  Homophone.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 03.02.2025.
//

import Foundation

class Homophon {
    let firstWordEN: String
    let secondWordEN: String
    let firstWordUA: String
    let secondWordUA: String
    let wordTranscription: String
    let firstSentense: String
    let secondSentense: String
    let firstWordImageName: String
    let secondWordImageName: String
    
    init(firstWordEN: String, secondWordEN: String, firstWordUA: String, secondWordUA: String,             transcription: String, firstSentence: String, secondSentence: String, firstWordImageName: String, secondWordImageName: String) {
        self.firstWordEN = firstWordEN
        self.secondWordEN = secondWordEN
        self.firstWordUA = firstWordUA
        self.secondWordUA = secondWordUA
        self.wordTranscription =             transcription
        self.firstSentense = firstSentence
        self.secondSentense = secondSentence
        self.firstWordImageName = firstWordImageName
        self.secondWordImageName = secondWordImageName
    }
}
