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
    private var currentHomophoneIndex: Int
    
    var currentHomophone: HomophoneWithImage {
        return homophonesList[currentHomophoneIndex]
    }
    
    // MARK: - Lifecycle
    init(homophones: [HomophoneWithImage], startIndex: Int) {
        self.homophonesList = homophones
        self.currentHomophoneIndex = startIndex
    }
    
    // MARK: - Methods
    func nextHomophone() {
        if currentHomophoneIndex < homophonesList.count - 1 {
            currentHomophoneIndex += 1
        }
    }
    
    func previousHomophone() {
        if currentHomophoneIndex > 0 {
            currentHomophoneIndex -= 1
        }
    }
    
    func getCurrentIndex() -> Int {
        return currentHomophoneIndex
    }
}
