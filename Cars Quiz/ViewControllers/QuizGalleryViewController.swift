//  QuizGalleryViewController.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 27.01.2025.
//

import UIKit

class QuizGalleryViewController: UIViewController {
    
    // MARK: - UI Components
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Quizes"
        
        setupTableView()
        tableView.reloadData()
        
        print("QuizGalleryViewController viewDidLoad")
    }
    
    // MARK: - Methods
    
    private func setupTableView() {
        tableView.register(QuizTableViewCell.self, forCellReuseIdentifier: QuizTableViewCell.identifier)
        
        tableView.rowHeight = 100
        tableView.separatorStyle = .none
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDelegate

extension QuizGalleryViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
        return QuizProvider.quizes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let quizCell = tableView.dequeueReusableCell(withIdentifier: QuizTableViewCell.identifier, for: indexPath) as? QuizTableViewCell else { return UITableViewCell() }
        let quiz = QuizProvider.quizes[indexPath.row]
        
        quizCell.configure(with: quiz.image, and: quiz.title)
        
        return quizCell
    }
}
