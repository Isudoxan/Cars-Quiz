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
        
        if indexPath.row == 0 {
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            if let carsQuizViewController = storyboard.instantiateViewController(withIdentifier: "CarsQuizViewController") as? CarsQuizViewController {
                navigationController?.pushViewController(carsQuizViewController, animated: true)
            }
        } else if indexPath.row == 1 {
            let homophonesViewController = HomophonesViewController()
            navigationController?.pushViewController(homophonesViewController, animated: true)
        }
    }
}

extension QuizGalleryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StyledQuizProvider.styledQuizes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let quizCell = tableView.dequeueReusableCell(withIdentifier: QuizTableViewCell.identifier, for: indexPath) as? QuizTableViewCell else { return UITableViewCell() }
        let styledQuiz = StyledQuizProvider.styledQuizes[indexPath.row]
        
        quizCell.configure(with: styledQuiz)
        
        return quizCell
    }
}
