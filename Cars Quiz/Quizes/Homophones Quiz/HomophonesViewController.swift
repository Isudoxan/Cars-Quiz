//
//  HomophonesViewController.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 31.01.2025.
//

import UIKit

class HomophonesViewController: UIViewController {
    
    // MARK: - Properties
    
    var homophonesGameEngine = HomophonesGameEngine(homophones: HomophonesWithImagesProvider.createHomophonesWithImages(from: HomophonesProvider.homophones))
    
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
    
    private lazy var previousButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("←", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(previousTapped), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonTouchDown(_:)), for: .touchDown)
        button.addTarget(self, action: #selector(buttonTouchUp(_:)), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        return button
    }()

    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("→", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonTouchDown(_:)), for: .touchDown)
        button.addTarget(self, action: #selector(buttonTouchUp(_:)), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        return button
    }()

    @objc func buttonTouchDown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        })
    }

    @objc func buttonTouchUp(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform.identity
        })
    }
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
        view.addSubview(previousButton)
        view.addSubview(nextButton)
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
        
        let previousButtonConstraints = [
            previousButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            previousButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            previousButton.widthAnchor.constraint(equalToConstant: 50),
            previousButton.heightAnchor.constraint(equalToConstant: 70)
        ]
        
        let nextButtonConstraints = [
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            nextButton.widthAnchor.constraint(equalToConstant: 50),
            nextButton.heightAnchor.constraint(equalToConstant: 70)
        ]
        
        NSLayoutConstraint.activate(containerViewConstrains)
        NSLayoutConstraint.activate(cardViewConstrains)
        NSLayoutConstraint.activate(previousButtonConstraints)
        NSLayoutConstraint.activate(nextButtonConstraints)
    }
    
    func configure() {
        let homophone = homophonesGameEngine.currentHomophone
        cardView.configure(with: homophone)
        displayHomophone()
    }
        
    @objc func previousTapped() {
        homophonesGameEngine.previousHomophone()
        displayHomophone()
    }
    
    @objc func nextTapped() {
        homophonesGameEngine.nextHomophone()
        displayHomophone()
    }
    
    func displayHomophone() {
        let homophone = homophonesGameEngine.currentHomophone
        cardView.configure(with: homophone)
    }
}
