//  QuizTableViewCell.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 27.01.2025.
//

import UIKit

class QuizTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "QuizTableViewCell"
    
    private let logoImageView: UIImageView = {
        let myImageView = UIImageView()
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        myImageView.contentMode = .scaleAspectFill
        myImageView.layer.cornerRadius = 12
        myImageView.clipsToBounds = true
        
        return myImageView
    }()
    
    private let quizTitleLabel: UILabel = {
        let myLabel = UILabel()
        
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.numberOfLines = 1
        myLabel.font = .boldSystemFont(ofSize: 26)
        myLabel.textColor = .white
        
        return myLabel
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupStyle()
        setupSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setupStyle() {
        selectionStyle = .none
    }
    
    private func setupSubviews() {
        contentView.addSubview(logoImageView)
        contentView.addSubview(quizTitleLabel)
    }
    
    private func setupLayout(){
        let imageViewConstraints = [
            logoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            logoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        
        let labelConstraints = [
            quizTitleLabel.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor, constant: 16),
            quizTitleLabel.trailingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: -16),
            quizTitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(imageViewConstraints)
        NSLayoutConstraint.activate(labelConstraints)
    }
    
    public func configure(with logo: UIImage?, and title: String?) {
        logoImageView.image = logo
        quizTitleLabel.text = title
    }
    
    public func configure(with logo: String?, and title: String?) {
        if let logo {
            let image = UIImage(named: logo)
            logoImageView.image = image
        }
    
        quizTitleLabel.text = title
    }
}
