//
//  ViewController.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 21.01.2025.
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

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    /// Dictionary of cars names and their images.
    var cars: [Car] = [
        Car(name: "nexon", imageName: "1"),
        Car(name: "zhugul", imageName: "2"),
        Car(name: "maseratti", imageName: "3"),
        Car(name: "bmw", imageName: "4"),
        Car(name: "ferrari", imageName: "5"),
        Car(name: "mclaren", imageName: "6"),
        Car(name: "mercedes", imageName: "7"),
        Car(name: "mercedes", imageName: "8"),
        Car(name: "delorean", imageName: "9"),
        Car(name: "mercedes", imageName: "10"),
        Car(name: "bmw", imageName: "11"),
        Car(name: "corvette", imageName: "12"),
        Car(name: "ferrari", imageName: "13"),
        Car(name: "hyundai", imageName: "14"),
        Car(name: "bugatti", imageName: "15")
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
        let userGuess = carBrandTextField.text?.lowercased()
        let currentCarName = currentCar?.name.lowercased()
        
        if userGuess == currentCarName {
            print("Wow, great!")
            
            self.currentCarIndex += 1
            self.currentCar = cars[currentCarIndex]
            
            setCarImageForCurrentCar()
            showHideResultLabel(success: true)
        } else {
            print("Try again!")
            showHideResultLabel(success: false)
        }
    }
    
    
    // MARK: - Methods
    
    func setCarImageForCurrentCar() {
        let carName = self.currentCar?.imageName
        
        if let carName {
            let carImage = UIImage(named: carName)
            carImageView.image = carImage
        }
    }
    
    func showHideResultLabel(success: Bool) {
        resultLabel.text = success ? "Wow, great job!👌" : "Try again🤔"
        resultLabel.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.resultLabel.isHidden = true
        })
    }
}
