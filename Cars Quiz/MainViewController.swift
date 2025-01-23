//
//  ViewController.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 21.01.2025.
//

//
// *TODO*:
//
// 2.5 h
// - Add tips (if user failed 2 times he can have a suggestion of the word, 1 letter of the work is shown + number of `*` to correspond to rest letters count)
// - Check if easy / medium / hard logic works okay if cars.count can't be divided by 3 without remainder✅
// - Refactor changeGameLevel method to use `switch` instead of `if-else-if-else...`✅
// - Add text `Score: ` to the `Score label`✅
// - Update the score counting logic✅
// - - If user guesses the car correctly we show `great job` label for 2 sec forward him to the next level and increment score by 1✅
// - - If user doesn't guess the car correctly we show the `Try again` label for 2 sec and forward him to the next level without incrementing the total score (total score stays the same)✅
//
// - - -
//
// - Create new Trello project for Cars Quiz and add tasks (and estimate them) for all the following points. When it's done feel free to remove this section from the project
// - Create `develop` branch and start working in develop for future features
// - Push repo to remote repo on GitHub
// - Read about iOS Auto Layout & Constraints and how they work in Storyboards
// - Try make the UI adaptive (responsive) to any device/screen size (don't spend more time than 1h & don't forget to work in the `feature/...` branch)
// - Implement `quiz gallery` page (main page of the app) with the list of available games which will consist of only `Cars Hero` item and tapping on it will open the game page (more info in Freeform diagram) using UITableView
//
// To read:
//
// - Differences between UIView.animate & UIView.transition
// - Read about `guard` / `defer` / `if` statements
// - Read about computed properties vc stored properties vs functions
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Properties
    
    var gameEngine = CarsGameEngine()
    
    var currentCar: Car?
    var currentCarIndex = 0
    var score:Int = 0
    
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
        
        self.scoreLabel.text = "Score: 0/" + String(cars.count)
        
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
            self.currentCarIndex += 1
            self.currentCar = cars[currentCarIndex]
            setCarImageForCurrentCar()
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
        
        resultLabel.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.resultLabel.isHidden = true
        })
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
