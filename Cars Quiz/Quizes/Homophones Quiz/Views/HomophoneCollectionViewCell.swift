//
//  CollectionView.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 10.02.2025.
//

import UIKit

class HomophoneCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HomophoneCell"
    
    private let cardView: HomophoneCardView = {
        let view = HomophoneCardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        contentView.addSubview(cardView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configure(with homophone: HomophoneWithImage) {
        cardView.configure(with: homophone)
    }
}
