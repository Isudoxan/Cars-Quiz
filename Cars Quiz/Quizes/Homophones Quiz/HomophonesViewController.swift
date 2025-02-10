//
//  HomophonesViewController.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 31.01.2025.
//

import UIKit

class HomophonesViewController: UIViewController {
    
    // MARK: - Properties
    
    private let storageManager = HomophonesStorageManager()
    private var homophonesGameEngine: HomophonesGameEngine?
    
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
        let previousButton = UIButton()
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        previousButton.setTitle("←", for: .normal)
        previousButton.titleLabel?.font = .boldSystemFont(ofSize: 30)
        previousButton.setTitleColor(.black, for: .normal)
        previousButton.addTarget(self, action: #selector(previousButtonTap), for: .touchUpInside)
        previousButton.addTarget(self, action: #selector(buttonTouchDown(_:)), for: .touchDown)
        previousButton.addTarget(self, action: #selector(buttonTouchUp(_:)), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        return previousButton
    }()

    private lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("→", for: .normal)
        nextButton.titleLabel?.font = .boldSystemFont(ofSize: 30)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTap), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(buttonTouchDown(_:)), for: .touchDown)
        nextButton.addTarget(self, action: #selector(buttonTouchUp(_:)), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        return nextButton
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
        
        loadGameEngineAndHomophones()
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
        displayHomophone()
    }
    
    func displayHomophone() {
        guard let gameEngine = homophonesGameEngine else { return }
        let homophone = gameEngine.currentHomophone
        cardView.configure(with: homophone)
    }

    @objc func previousButtonTap() {
        guard let gameEngine = homophonesGameEngine else { return }
        gameEngine.previousHomophone()
        storageManager.saveCurrentIndex(gameEngine.getCurrentIndex())
        displayHomophone()
    }

    @objc func nextButtonTap() {
        guard let gameEngine = homophonesGameEngine else { return }
        gameEngine.nextHomophone()
        storageManager.saveCurrentIndex(gameEngine.getCurrentIndex())
        displayHomophone()
    }
    
    private func loadGameEngineAndHomophones(){
        let savedIndex = storageManager.loadCurrentIndex()
        
        let homophonesList = HomophonesWithImagesProvider.createHomophonesWithImages(from: HomophonesProvider.homophones)
        
        homophonesGameEngine = HomophonesGameEngine(homophones: homophonesList, startIndex: savedIndex)
    }
}
