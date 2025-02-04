//
//  HomophonesViewController.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 31.01.2025.
//

import UIKit

class HomophonesViewController: UIViewController {
    
    // MARK: - Properties
    
    var homophonesWithImages = {
        let homophones = HomophonesProvider.homophones
        let homophonesWithImages = HomophonesWithImagesProvider.createHomophonesWithImages(from: homophones)
        return homophonesWithImages
    }
    
    var firstSentence: String = ""
    var secondSentence: String = ""
    var transcription: String = ""
    
    // MARK: - UI Components
    
    let containerView = UIView()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("HomophonesViewController viewDidLoad")
        
        view.backgroundColor = .systemBackground
        
        title = "Homophones"
        
        setupUI()
    }

    // MARK: - Methods

    private func setupUI() {
        
        containerViewSettings()
        
    }
    
    private func containerViewSettings(){
        
        view.addSubview(containerView)

        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .cyan
        let containerViewConstrains = [
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(containerViewConstrains)
        
    }
    
}
