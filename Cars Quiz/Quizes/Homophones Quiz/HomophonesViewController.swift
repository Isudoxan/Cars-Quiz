//
//  HomophonesViewController.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 31.01.2025.
//

import UIKit

class HomophonesViewController: UIViewController {
    
    // MARK: - Properties
    
    var homophonesWithImages = {
        let homophones = HomophonesProvider.homophones
        let homophonesWithImages = HomophonesWithImagesProvider.createHomophonesWithImages(from: homophones)
        return homophonesWithImages
    }
    
    // MARK: - UI Components
    
    let containerView = UIView()
    let scrollView = UIScrollView()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("HomophonesViewController viewDidLoad")
        
        view.backgroundColor = .systemBackground
        
        title = "Homophones"
        
        setupUI()
    }

    // MARK: - Methods

    private func setupUI() {
        
        scrollViewSettings()
        containerViewSettings()
        
    }
    
    private func scrollViewSettings() {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        
        let scrollViewConstrains = [
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(scrollViewConstrains)
        
    }
    
    private func containerViewSettings(){
        
        scrollView.addSubview(containerView)

        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        let containerViewConstrains = [
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ]
        
        NSLayoutConstraint.activate(containerViewConstrains)
        
    }
    
}
