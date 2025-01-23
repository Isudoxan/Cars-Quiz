//
//  ViewController.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 21.01.2025.
//

//
// *TODO*:
//
// - Add tips (if user failed 2 times he can have a suggestion of the word)
// - Check if easy / medium / hard logic works okay if cars.count can't be divided by 3 without remainder
// - Refactor changeGameLevel method to use `switch` instead of `if-else-if-else...`
//
// To read:
// - Differences between UIView.animate & UIView.transition
// - Read about `guard` / `defer` / `if` statements
// - Read about `computed properties` and `stored properties`
//

import UIKit

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

class MainViewController: UIViewController, UITextFieldDelegate {
    
    
    // MARK: - Properties
    
    var gameEngine = CarsGameEngine()
    
    var currentCar: Car?
    var currentCarIndex = 0
    
    var cars: [Car] {
        return gameEngine.cars
    }
    
    // MARK: - UI Components
    
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var carBrandTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Main view loaded!")
        
        self.scoreLabel.text = "1/" + String(cars.count)
        
        resultLabel.isHidden = true
        carBrandTextField.delegate = self
        
        self.currentCar = cars[currentCarIndex]
        setCarImageForCurrentCar()
        
    }
    
    // MARK: - Actions
    
    @IBAction func okButtonTap(_ sender: Any) {
        performOkAction()
    }
    
    // MARK: - Methods
    
    func performOkAction() {
        carBrandTextField.resignFirstResponder()
        
        let userGuessWithSpace = carBrandTextField.text?.lowercased()
        let userGuess = userGuessWithSpace?.trimmingCharacters(in: .whitespaces)
        let currentCarName = currentCar?.name.lowercased()
        
        defer {
            carBrandTextField.text = nil
        }
        
        guard userGuess == currentCarName else {
            hapticFeedbackError()
            showHideResultLabel(result: .incorrectGuess)
            
            return
        }
        
        if self.currentCarIndex == cars.count - 1 {
            hapticFeedbackSuccess()
            showHideResultLabel(result: .wonGame)
        } else {
            hapticFeedbackSuccess()
            
            self.currentCarIndex += 1
            self.currentCar = cars[currentCarIndex]
            
            setCarImageForCurrentCar()
            showHideResultLabel(result: .correctGuess)
        }
    }
    
    func setCarImageForCurrentCar() {
        guard let carName = self.currentCar?.imageName else { return }
        
        UIView.transition(
            with: carImageView,
            duration: 0.5,
            options: .transitionCrossDissolve,
            animations: {
                self.carImageView.image = UIImage(named: carName)
            },
            completion: nil
        )
    }
    
    func showHideResultLabel(result: GameResult) {
        switch result {
        case .correctGuess:
            resultLabel.text = "Wow, great job!👌"
            self.changeGameLevel()
            self.changeScore()
        case .incorrectGuess:
            resultLabel.text = "Try again🤔"
        case .wonGame:
            resultLabel.text = "You won!!! 🎉🎉🎉"
            self.levelLabel.text = "GAME OVER!"
        }
        
        resultLabel.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.resultLabel.isHidden = true
        })
    }
    
    func changeGameLevel() {
        let totalCars = cars.count
        let firstLevel = totalCars / 3
        let secondLevel = 2 * firstLevel
        
        if self.currentCarIndex + 1 <= firstLevel {
            self.levelLabel.text = "Level: Easy 🟢"
        } else if self.currentCarIndex + 1 <= secondLevel {
            self.levelLabel.text = "Level: Medium 🟠"
        } else if self.currentCarIndex + 1 <= totalCars {
            self.levelLabel.text = "Level: Hard 🔴"
        }
    }
    
    func changeScore() {
        self.scoreLabel.text = String(self.currentCarIndex + 1) + "/" + String(cars.count)
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        performOkAction()
        
        return true
    }
    
    // MARK: - Helpers
    
    func hapticFeedbackSuccess() {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
    }
    
    func hapticFeedbackError() {
        UINotificationFeedbackGenerator().notificationOccurred(.error)
    }
}
