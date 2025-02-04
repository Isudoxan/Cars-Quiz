//
//  ViewController.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 21.01.2025.
//

import UIKit

class CarsQuizViewController: UIViewController {
    
    // MARK: - Properties
    
    var gameEngine = CarsGameEngine()
    var cars: [Car] { return gameEngine.cars }
    var currentCar: Car? { return gameEngine.currentCar }
    
    // MARK: - UI Components
    
    @IBOutlet weak var scrollView: UIScrollView!
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
        
        scoreLabel.text = "Score: 0/" + String(cars.count)
        hintLabel.isHidden = true
        resultLabel.isHidden = true
        
        carBrandTextField.delegate = self
        
        setCarImageForCurrentCar()
        
        setupNotificationsObservers()
    }
    
    // MARK: - Notifications
    
    func setupNotificationsObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
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
        
        let userGuess = carBrandTextField.text
        
        switch gameEngine.computeResult(for: userGuess) {
        case .correct:
            hapticFeedbackSuccess()
            showHideResultLabel(result: .correct)
            updateGameLevel()
            updateScore()
            setCarImageForCurrentCar()
        case .incorrect:
            hapticFeedbackError()
            showHideResultLabel(result: .incorrect)
            updateGameLevel()
            setCarImageForCurrentCar()
        case .empty:
            hapticFeedbackError()
            presentErrorAlert()
        case .wonGame:
            hapticFeedbackSuccess()
            showHideResultLabel(result: .wonGame)
        }
        
        carBrandTextField.text = nil
    }
    
    func setCarImageForCurrentCar() {
        guard let carName = self.currentCar?.imageName else { return }
        
        UIView.transition(
            with: carImageView,
            duration: 0.5,
            options: .transitionCrossDissolve,
            animations: { [weak self] in
                self?.carImageView.image = UIImage(named: carName)
            },
            completion: nil
        )
    }
    
    func showHideResultLabel(result: CarsGameEngine.GameResult) {
        switch result {
        case .correct:
            resultLabel.text = "Wow, great job!👌"
        case .incorrect:
            resultLabel.text = "Try again🤔"
        case .empty:
            break
        case .wonGame:
            resultLabel.text = "You won!!! 🎉🎉🎉"
            levelLabel.text = "GAME OVER!"
        }
        
        hintLabel.isHidden = true
        resultLabel.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: { [weak self] in
            self?.resultLabel.isHidden = true
        })
    }
    
    func showHint() {
        guard let hint = gameEngine.hintForCurrentCar() else {
            hintLabel.text = nil
            hintLabel.isHidden = true
            return
        }
        
        hintLabel.isHidden = false
        hintLabel.text = "Hint: " + hint
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
    
    func updateGameLevel() {
        switch gameEngine.currentGameLevel() {
        case .easy:
            levelLabel.text = "Level: Easy 🟢"
        case .medium:
            levelLabel.text = "Level: Medium 🟠"
        case .hard:
            levelLabel.text = "Level: Hard 🔴"
        case .unknown:
            levelLabel.text = "Unknown Level"
        }
    }
    
    func updateScore() {
        let currentScore = gameEngine.currentScore
        scoreLabel.text = "Score: " + String(currentScore) + "/" + String(cars.count)
    }
}

// MARK: - UITextFieldDelegate

extension CarsQuizViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        performOkAction()
        
        return true
    }
}

// MARK: - Keyboard Handling

extension CarsQuizViewController {
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        let keyboardHeight = keyboardFrame.height
        scrollView.setContentOffset(CGPoint(x: scrollView.contentOffset.x, y: keyboardHeight), animated: true)
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        scrollView.setContentOffset(CGPoint(x: scrollView.contentOffset.x, y: 0), animated: true)
    }
}
