//
//  WordImageView.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 04.02.2025.
//

import UIKit

class WordImageView: UIView {
    
    // MARK: - Properties
    
    private var widthConstraint: NSLayoutConstraint?
    
    // MARK: - UI Components
    
    let wordENLabel: UILabel = {
        let wordENLabel = UILabel()
        
        wordENLabel.translatesAutoresizingMaskIntoConstraints = false
        wordENLabel.textAlignment = .center
        wordENLabel.textColor = .blue
        wordENLabel.font = .boldSystemFont(ofSize: 35)
        wordENLabel.numberOfLines = 1
        
        return wordENLabel
    }()
    
    let wordUALabel: UILabel = {
        let wordUALabel = UILabel()
        
        wordUALabel.translatesAutoresizingMaskIntoConstraints = false
        wordUALabel.textAlignment = .center
        wordUALabel.textColor = .black
        wordUALabel.font = .systemFont(ofSize: 15)
        wordUALabel.numberOfLines = 1
    
        return wordUALabel
    }()
    
    let wordImageView = {
        let wordImageView = UIImageView()
        
        wordImageView.translatesAutoresizingMaskIntoConstraints = false
        wordImageView.contentMode = .scaleAspectFit
        
        return wordImageView
    }()
    
    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setupSubviews() {
        addSubview(wordENLabel)
        addSubview(wordUALabel)
        addSubview(wordImageView)
    }
    
    private func setupConstraints() {
        let wordENLabelConstraints = [
            wordENLabel.topAnchor.constraint(equalTo: topAnchor),
            wordENLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            wordENLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        
        let wordUALabelConstraints = [
            wordUALabel.topAnchor.constraint(equalTo: wordENLabel.bottomAnchor, constant: 5),
            wordUALabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            wordUALabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        
        let wordImageViewConstraints = [
            wordImageView.topAnchor.constraint(equalTo: wordUALabel.bottomAnchor, constant: 5),
            wordImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            wordImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            wordImageView.widthAnchor.constraint(equalToConstant: 100),
            wordImageView.heightAnchor.constraint(equalToConstant: 100)
        ]

        NSLayoutConstraint.activate(wordENLabelConstraints)
        NSLayoutConstraint.activate(wordUALabelConstraints)
        NSLayoutConstraint.activate(wordImageViewConstraints)
    }
    
    func configure(wordEN: String, wordUA: String, image: UIImage?) {
        wordENLabel.text = wordEN
        wordUALabel.text = wordUA
        wordImageView.image = image

        updateWidth()
    }

    private func updateWidth() {
        let maxWidth = max(wordENLabel.intrinsicContentSize.width, wordUALabel.intrinsicContentSize.width) + 20

        widthConstraint?.isActive = false

        widthConstraint = widthAnchor.constraint(equalToConstant: maxWidth)
        widthConstraint?.isActive = true
    }
}
