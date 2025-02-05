//
//  HomophonesViewController.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 31.01.2025.
//

import UIKit

class HomophonesViewController: UIViewController {
    
    // MARK: - Properties
    
    var homophonesWithImages: [HomophoneWithImage] {
        let homophones = HomophonesProvider.homophones
        let homophonesWithImages = HomophonesWithImagesProvider.createHomophonesWithImages(from: homophones)
        return homophonesWithImages
    }
    
    // MARK: - UI Components
    
    private let containerView: UIView = {
        let containerView = UIView()
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .systemBackground
        
        return containerView
    }()
    
    let cardView: HomophoneCardView = {
        let cardView = HomophoneCardView()
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        return cardView
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("HomophonesViewController viewDidLoad")
        
        view.backgroundColor = .systemBackground
        
        setupSubviews()
        setupConstraints()
        configure()
    }

    // MARK: - Methods
    
    private func setupSubviews() {
        view.addSubview(containerView)
        containerView.addSubview(cardView)
    }
    
    private func setupConstraints() {
        let containerViewConstrains = [
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
        
        let cardViewConstrains = [
            cardView.topAnchor.constraint(equalTo: containerView.topAnchor),
            cardView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -150),
            cardView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            cardView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15)
        ]

        NSLayoutConstraint.activate(containerViewConstrains)
        NSLayoutConstraint.activate(cardViewConstrains)
    }
    
    func configure() {
        let homophone = homophonesWithImages[4]
        cardView.configure(with: homophone)
    }
}
