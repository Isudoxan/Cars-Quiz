//
//  QuizGalleryViewController.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 27.01.2025.
//

import UIKit

class Quiz {
    
    let title: String
    var image: String
    
    init(title: String, image: String) {
        self.title = title
        self.image = image
    }
}

class QuizGalleryViewController: UIViewController {
    
    let quizes = [
        Quiz(title: "Cars Hero 🚘", image: "CarsQuizLogo")
    ]
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Quizes"
         
        tableView.register(QuizTableViewCell.nib(), forCellReuseIdentifier: QuizTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.separatorStyle = .none
        
        tableView.reloadData()
        
        print("QuizGalleryViewController viewDidLoad")
    }
}

extension QuizGalleryViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("TableView didSelectRowAt \(indexPath)")
    
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let carsQuizViewController = storyboard
            .instantiateViewController(withIdentifier: "CarsQuizViewController") as? CarsQuizViewController
        
        guard let carsQuizViewController else { return }
        
        navigationController?.pushViewController(carsQuizViewController, animated: true)
    }
}

extension QuizGalleryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let quizCell = tableView.dequeueReusableCell(withIdentifier: QuizTableViewCell.identifier, for: indexPath) as? QuizTableViewCell else { return UITableViewCell() }
        
        let quiz = quizes[indexPath.row]
        
        quizCell.quizTitleLabel.text = quiz.title
        quizCell.logoImageView.image = UIImage(named: quiz.image)
        
        return quizCell
    }
}
