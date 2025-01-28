//
//  QuizTableViewCell.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 27.01.2025.
//

import UIKit

class QuizTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "QuizTableViewCell"
    
    // MARK: - UI Components
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var quizTitleLabel: UILabel!
    
    // MARK: - Methods
    
    static func nib() -> UINib {
        return UINib(nibName: "QuizTableViewCell", bundle: .main)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization
        logoImageView.layer.cornerRadius = 16
    }
}
