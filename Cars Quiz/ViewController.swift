//
//  ViewController.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 21.01.2025.
//

import UIKit

//
// *TODO*:
//
// 1. Display label above the image to show the current level ("Easy 🟢" / "Medium 🟠" / "Hard 🔴") based on car level that is displayed on the image.
// 2. Add app icon.
// 3. Add launch screen.
// 4. Ignore whitespaces in the beginning/end of the car name in text field.
//

class Car {
    
    let name: String
    let imageName: String
    
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}

enum GameResult {
    case correctGuess
    case incorrectGuess
    case wonGame
}


class MainViewController: UIViewController {
    
    // MARK: - Properties
    
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
    
    
    // MARK: - UI Components
    
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var carBrandTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Main view loaded!")
        
        resultLabel.isHidden = true
        
        self.currentCar = cars[currentCarIndex]
        setCarImageForCurrentCar()
    }
    
    
    // MARK: - Actions
    
    @IBAction func okButtonTap(_ sender: Any) {
        carBrandTextField.resignFirstResponder()
        
        let userGuess = carBrandTextField.text?.lowercased()
        let currentCarName = currentCar?.name.lowercased()
        
        if userGuess == currentCarName {
            if self.currentCarIndex == cars.count - 1 {
                showHideResultLabel(result: .wonGame)
            } else {
                self.currentCarIndex += 1
                self.currentCar = cars[currentCarIndex]
                
                setCarImageForCurrentCar()
                showHideResultLabel(result: .correctGuess)
            }
        } else {
            showHideResultLabel(result: .incorrectGuess)
        }
        
        carBrandTextField.text = nil
    }
    
    
    // MARK: - Methods
    
    func setCarImageForCurrentCar() {
        let carName = self.currentCar?.imageName
        
        if let carName {
            let carImage = UIImage(named: carName)
            carImageView.image = carImage
        }
    }
    
    func showHideResultLabel(result: GameResult) {
        switch result {
        case .correctGuess:
            resultLabel.text = "Wow, great job!👌"
        case .incorrectGuess:
            resultLabel.text = "Try again🤔"
        case .wonGame:
            resultLabel.text = "You won!!! 🎉🎉🎉"
        }
        
        resultLabel.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.resultLabel.isHidden = true
        })
    }
}
