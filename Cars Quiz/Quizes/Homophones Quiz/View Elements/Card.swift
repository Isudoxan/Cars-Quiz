//
//  Card.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 04.02.2025.
//

import UIKit

class Card {
    
    // MARK: - UI Components
    let firstWordImageView = WordImageView()
    let secondWordImageView = WordImageView()
    let cardView = UIView()
    let topView = UIView()
    let bottomView = UIView()
    let transcription = UILabel()
    
    // MARK: - Init
    
    init() {
        setupElements()
        setupfirstWordViewConstraints()
        setupsecondWordViewConstraints()
        setupTopAndBottomView()
        setupLabel()
    }
    
    // MARK: - Methods
    
    private func setupElements() {
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.backgroundColor = .systemBackground
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.3
        cardView.layer.shadowOffset = CGSize(width: 3, height: 3)
        cardView.layer.shadowRadius = 5
    }

    private func setupfirstWordViewConstraints(){
        let firstWordView = firstWordImageView.view
        cardView.addSubview(firstWordView)
        let firstWordViewConstraints = [
            firstWordView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 80),
            firstWordView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -260),
            firstWordView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -180),
            firstWordView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 52)
        ]
        NSLayoutConstraint.activate(firstWordViewConstraints)
    }
    
    private func setupsecondWordViewConstraints(){
        let secondWordView = secondWordImageView.view
        cardView.addSubview(secondWordView)
        let secondWordViewConstraints = [
            secondWordView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 303),
            secondWordView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -67),
            secondWordView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -50),
            secondWordView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 213)
        ]
        NSLayoutConstraint.activate(secondWordViewConstraints)
    }
    
    private func setupTopAndBottomView(){
        topView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .blue
        bottomView.backgroundColor = .blue
        cardView.addSubview(topView)
        cardView.addSubview(bottomView)
        
        let topViewConstraints = [
            topView.topAnchor.constraint(equalTo: cardView.topAnchor),
            topView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -500),
            topView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            topView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor)
        ]
        
        let bottomViewConstraints = [
            bottomView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 500),
            bottomView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor),
            bottomView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            bottomView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor)
        ]
        
        NSLayoutConstraint.activate(topViewConstraints)
        NSLayoutConstraint.activate(bottomViewConstraints)
    }
    
    private func setupLabel(){
        transcription.text = "[wi:k]"
        transcription.translatesAutoresizingMaskIntoConstraints = false
        transcription.textColor = .black
        transcription.textAlignment = .center
        transcription.font = .boldSystemFont(ofSize: 16)
        cardView.addSubview(transcription)
        
        let transcriptionConstraints = [
            transcription.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 80),
            transcription.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -435),
            transcription.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 225),
            transcription.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -5)
            
        ]
        
        NSLayoutConstraint.activate(transcriptionConstraints)
    }
}
