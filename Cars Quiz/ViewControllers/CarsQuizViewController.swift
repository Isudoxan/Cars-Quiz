//
//  ViewController.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 21.01.2025.
//

import UIKit

class CarsQuizViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Properties
    
    var gameEngine = CarsGameEngine()
    
    var currentCar: Car?
    var currentCarIndex = 0
    var score: Int = 0
    
    var cars: [Car] {
        return gameEngine.cars
    }
    
    // MARK: - UI Components
    
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var carBrandTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var hintLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CarsQuizViewController viewDidLoad")
        
        title = "Cars Hero"
        
        self.scoreLabel.text = "Score: 0/" + String(cars.count)
        self.hintLabel.isHidden = true
        
        resultLabel.isHidden = true
        carBrandTextField.delegate = self
        
        self.currentCar = cars[currentCarIndex]
        setCarImageForCurrentCar()
        
    }
    
    // MARK: - Actions
    
    @IBAction func hintButtonTap(_ sender: Any) {
        showHint()
    }
    @IBAction func okButtonTap(_ sender: Any) {
        performOkAction()
    }
    
    // MARK: - Methods
    
    func performOkAction() {
        carBrandTextField.resignFirstResponder()
        
        if carBrandTextField.text != "" {
            let userGuessWithSpace = carBrandTextField.text?.lowercased()
            let userGuess = userGuessWithSpace?.trimmingCharacters(in: .whitespaces)
            let currentCarName = currentCar?.name.lowercased()
            
            defer {
                carBrandTextField.text = nil
            }
            
            guard userGuess == currentCarName else {
                hapticFeedbackError()
                self.currentCarIndex += 1
                if currentCarIndex < cars.count{
                    self.currentCar = cars[currentCarIndex]
                    setCarImageForCurrentCar()
                    showHideResultLabel(result: .incorrectGuess)
                    
                    return
                }
                else{
                    showHideResultLabel(result: .wonGame)
                    return
                }
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
        } else {
            presentErrorAlert()
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
    
    func showHideResultLabel(result: CarsGameEngine.GameResult) {
        switch result {
        case .correctGuess:
            resultLabel.text = "Wow, great job!👌"
            self.changeGameLevel()
            self.changeScore()
        case .incorrectGuess:
            resultLabel.text = "Try again🤔"
            self.changeGameLevel()
        case .wonGame:
            resultLabel.text = "You won!!! 🎉🎉🎉"
            self.levelLabel.text = "GAME OVER!"
        }
        
        hintLabel.isHidden = true
        resultLabel.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.resultLabel.isHidden = true
        })
    }
    
    func showHint() {
        if let carName = currentCar?.name {
            let hintForShow = carName.enumerated()
                .map { index, char in
                    index == 0 ? char : "*"
                }
                .map(String.init)
                .joined()
            
            hintLabel.isHidden = false
            hintLabel.text = "Hint: " + hintForShow
        } else {
            print("Hint is not available")
        }
    }
    
    func presentErrorAlert() {
        let alert = UIAlertController(
            title: "No car brand",
            message: "Please enter car brand or use hint!",
            preferredStyle: .alert
        )
        
        let alertAction = UIAlertAction(title: "Ok!", style: .default)
        
        alert.addAction(alertAction)
        
        present(alert, animated: true)
    }
    
    func changeGameLevel() {
        let totalCars = cars.count
        let firstLevel = totalCars / 3
        let secondLevel = 2 * firstLevel
        let currentIndex = self.currentCarIndex + 1

        switch currentIndex {
        case 1...firstLevel:
            self.levelLabel.text = "Level: Easy 🟢"
        case (firstLevel + 1)...secondLevel:
            self.levelLabel.text = "Level: Medium 🟠"
        case (secondLevel + 1)...totalCars:
            self.levelLabel.text = "Level: Hard 🔴"
        default:
            self.levelLabel.text = "Unknown Level"
        }
    }
    
    func changeScore() {
        self.score += 1
        self.scoreLabel.text = "Score: " + String(score) + "/" + String(cars.count)
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
