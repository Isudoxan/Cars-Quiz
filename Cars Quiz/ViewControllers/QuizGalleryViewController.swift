//
//  QuizGalleryViewController.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 27.01.2025.
//

import UIKit



class QuizGalleryViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let games = [
        "Cars Quiz🧩",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Quizes"
         
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "QuizCell")
        
        tableView.delegate = self
        tableView.dataSource = self
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
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell", for: indexPath)
        
        cell.textLabel?.text = games[indexPath.row]
        
        return cell
    }
}
