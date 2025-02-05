//
//  HomophonesGameEngine.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 03.02.2025.
//

import Foundation

class HomophonesGameEngine {
    
    // MARK: - Properties
    
    private var homophonesList: [HomophoneWithImage]
    private var currentHomophoneIndex = 0
    
    var currentHomophone: HomophoneWithImage {
        return homophonesList[currentHomophoneIndex]
    }
    
    // MARK: - Lifecycle
    
    init(homophones: [HomophoneWithImage]) {
        self.homophonesList = homophones
    }
    
    // MARK: - Methods
    
    func showNextHomophone() {
        if currentHomophoneIndex < homophonesList.count - 1 {
            currentHomophoneIndex += 1
        }
    }
    
    func showPreviousHomophone() {
        if currentHomophoneIndex > 0 {
            currentHomophoneIndex -= 1
        }
    }
}
