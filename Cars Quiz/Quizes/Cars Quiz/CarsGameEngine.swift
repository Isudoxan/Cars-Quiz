//
//  GameEngine.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 23.01.2025.
//

import Foundation

class CarsGameEngine {

    class Car {
        let name: String
        let imageName: String
        
        init(name: String, imageName: String) {
            self.name = name
            self.imageName = imageName
        }
    }
    
    enum GameResult {
        case correct
        case incorrect
        case empty
        case wonGame
    }
    
    enum GameLevel {
        case easy
        case medium
        case hard
        case unknown
    }
    
    /// Dictionary of cars names and their images.
    var cars: [Car] = [
        // Easy
        Car(name: "bmw", imageName: "4"),
        Car(name: "bmw", imageName: "11"),
        Car(name: "mercedes", imageName: "10"),
        Car(name: "mercedes", imageName: "7"),
        Car(name: "mercedes", imageName: "8"),
        
        // Medium
        Car(name: "hyundai", imageName: "14"),
        Car(name: "bugatti", imageName: "15"),
        Car(name: "maseratti", imageName: "3"),
        Car(name: "ferrari", imageName: "5"),
        Car(name: "mclaren", imageName: "6"),
        
        // Hard
        Car(name: "ferrari", imageName: "13"),
        Car(name: "corvette", imageName: "12"),
        Car(name: "delorean", imageName: "9"),
        Car(name: "nexon", imageName: "1"),
        Car(name: "zhugul", imageName: "2")
    ]
    
    var currentCar: Car?
    var currentCarIndex = 0
    var currentScore = 0
    
    // MARK: - Lifecycle
    
    init() {
        self.currentCar = cars[currentCarIndex]
    }
    
    // MARK: - Methods
    
    func computeResult(for userGuess: String?) -> GameResult {
        guard let userGuess, !userGuess.isEmpty else { return .empty }
        
        let userGuessClean = userGuess
            .lowercased()
            .trimmingCharacters(in: .whitespaces)
        let currentCarName = currentCar?.name.lowercased()
        
        guard userGuessClean == currentCarName else {
            currentCarIndex += 1
            
            if currentCarIndex < cars.count {
                currentCar = cars[currentCarIndex]
                return .incorrect
            } else {
                return .wonGame
            }
        }
        
        guard currentCarIndex < cars.count - 1 else { return .wonGame }

        currentCarIndex += 1
        currentCar = cars[currentCarIndex]
        incrementScore()

        return .correct
    }
    
    func incrementScore() {
        currentScore += 1
    }
    
    func currentGameLevel() -> GameLevel {
        let totalCars = cars.count
        let firstLevel = totalCars / 3
        let secondLevel = 2 * firstLevel
        let currentIndex = currentCarIndex + 1

        switch currentIndex {
        case 1...firstLevel:
            return .easy
        case (firstLevel + 1)...secondLevel:
            return .medium
        case (secondLevel + 1)...totalCars:
            return .hard
        default:
            return .unknown
        }
    }
    
    func hintForCurrentCar() -> String? {
        guard let carName = currentCar?.name else { return nil }
        
        let hint = carName
            .enumerated()
            .map { index, char in
                index == 0 ? char : "*"
            }
            .map(String.init)
            .joined()
        
        return hint
    }
}
