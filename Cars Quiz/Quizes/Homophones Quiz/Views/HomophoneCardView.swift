//
//  HomophoneCardView.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 04.02.2025.
//

import UIKit

class HomophoneCardView: UIView {
    
    // MARK: - UI Components
    
    private let topView: UIView = {
        let topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .blue
        
        return topView
    }()
    
    private let firstWordImageView: WordImageView = {
        let firstWordImageView = WordImageView()
        firstWordImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return firstWordImageView
    }()
    
    private let secondWordImageView: WordImageView = {
        let secondWordImageView = WordImageView()
        secondWordImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return secondWordImageView
    }()
    
    private let transcriptionLabel: UILabel = {
        let transcriptionLabel = UILabel()
        transcriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        transcriptionLabel.textColor = .black
        transcriptionLabel.textAlignment = .center
        transcriptionLabel.font = .boldSystemFont(ofSize: 18)
        
        return transcriptionLabel
    }()
    
    private let bottomView: UIView = {
        let bottomView = UIView()
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.backgroundColor = .blue
        
        return bottomView
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setupView() {
        backgroundColor = .white
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowRadius = 5
    }
    
    private func setupSubviews() {
        addSubview(topView)
        addSubview(firstWordImageView)
        addSubview(secondWordImageView)
        addSubview(transcriptionLabel)
        addSubview(bottomView)
    }
    
    private func setupConstraints() {
        let topViewConstraints = [
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topView.topAnchor.constraint(equalTo: topAnchor),
            topView.heightAnchor.constraint(equalToConstant: 55)
        ]
        
        let firstWordImageViewConstraints = [
            firstWordImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            firstWordImageView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -150),
            firstWordImageView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 14)
        ]

        let secondWordImageViewConstraints = [
            secondWordImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            secondWordImageView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 150),
            secondWordImageView.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -14)
        ]
        
        let transcriptionLabelConstraints = [
            transcriptionLabel.leadingAnchor.constraint(greaterThanOrEqualTo: firstWordImageView.trailingAnchor, constant: 16),
            transcriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            transcriptionLabel.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 36)
        ]
        
        let bottomViewConstraints = [
            bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 55)
        ]
        
        NSLayoutConstraint.activate(topViewConstraints)
        NSLayoutConstraint.activate(firstWordImageViewConstraints)
        NSLayoutConstraint.activate(secondWordImageViewConstraints)
        NSLayoutConstraint.activate(transcriptionLabelConstraints)
        NSLayoutConstraint.activate(bottomViewConstraints)
    }
    
    func configure(with homophone: HomophoneWithImage) {
        firstWordImageView.configure(wordEN: homophone.firstWordEN, wordUA: homophone.firstWordUA, image: homophone.firstWordImage)
        secondWordImageView.configure(wordEN: homophone.secondWordEN, wordUA: homophone.secondWordUA, image: homophone.secondWordImage)
        
        transcriptionLabel.text = homophone.homophone.wordTranscription
    }
}
