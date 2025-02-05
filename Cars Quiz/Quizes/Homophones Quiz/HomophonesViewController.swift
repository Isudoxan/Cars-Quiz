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
    
    // MARK: - UI Components
    
    let containerView = UIView()
    let cardView = Card()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("HomophonesViewController viewDidLoad")
        
        view.backgroundColor = .systemBackground
        
        setupUI()
    }

    // MARK: - Methods

    private func setupUI() {
        
        containerViewSettings()
        cardViewSettings()
        
    }
    
    private func containerViewSettings(){
        
        view.addSubview(containerView)

        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .systemBackground
        let containerViewConstrains = [
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(containerViewConstrains)
        
    }
    
    private func cardViewSettings(){
        cardView.cardView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(cardView.cardView)
        let cardViewConstrains = [
            cardView.cardView.topAnchor.constraint(equalTo:containerView.topAnchor , constant: 100),
            cardView.cardView.bottomAnchor.constraint(equalTo:containerView.bottomAnchor , constant: -200),
            cardView.cardView.trailingAnchor.constraint(equalTo:containerView.trailingAnchor , constant: -15),
            cardView.cardView.leadingAnchor.constraint(equalTo:containerView.leadingAnchor , constant: 15)
        ]
        
        NSLayoutConstraint.activate(cardViewConstrains)
    }
    
}
