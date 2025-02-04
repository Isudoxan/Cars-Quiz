//
//  Card.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 04.02.2025.
//

import UIKit

class Card {
    
    // MARK: - UI Components
    let wordImageView = WordImageView()
    let cardView = UIView()
    
    // MARK: - Init
    
    init() {
        setupElements()
        setupConstraints()
    }
    
    // MARK: - Methods
    
    private func setupElements() {
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.backgroundColor = .systemBackground
        wordImageView.view.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(wordImageView.view)
    }

    private func setupConstraints(){
        let wordImageViewConstraints = [
            wordImageView.view.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 25),
            wordImageView.view.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 250),
            wordImageView.view.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 150),
            wordImageView.view.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10)
        ]
    }
    
}
