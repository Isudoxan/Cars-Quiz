//
//  GameEngine.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 23.01.2025.
//

import Foundation

class CarsGameEngine {
    
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
}
