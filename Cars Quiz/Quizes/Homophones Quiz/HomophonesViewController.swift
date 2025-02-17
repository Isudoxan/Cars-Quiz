//
//  HomophonesViewController.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 31.01.2025.
//

import UIKit

class HomophonesViewController: UIViewController {
    
    // MARK: - Properties
    
    private let storageManager = HomophonesStorageManager()
    private var homophonesGameEngine: HomophonesGameEngine?
    private var currentIndex: Int = 0
    
    // MARK: - UI Components
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 25
        layout.minimumInteritemSpacing = 0

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HomophoneCollectionViewCell.self, forCellWithReuseIdentifier: HomophoneCollectionViewCell.identifier)

        return collectionView
    }()

    private lazy var previousButton: UIButton = {
        let previousButton = UIButton()
        
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        previousButton.setTitle("←", for: .normal)
        previousButton.titleLabel?.font = .boldSystemFont(ofSize: 30)
        previousButton.setTitleColor(.black, for: .normal)
        previousButton.addTarget(self, action: #selector(previousButtonTap), for: .touchUpInside)
        previousButton.addTarget(self, action: #selector(buttonTouchDown(_:)), for: .touchDown)
        previousButton.addTarget(self, action: #selector(buttonTouchUp(_:)), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        
        return previousButton
    }()

    private lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("→", for: .normal)
        nextButton.titleLabel?.font = .boldSystemFont(ofSize: 30)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTap), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(buttonTouchDown(_:)), for: .touchDown)
        nextButton.addTarget(self, action: #selector(buttonTouchUp(_:)), for: [.touchUpInside, .touchUpOutside, .touchCancel])

        
        return nextButton
    }()
    
    @objc func buttonTouchDown(_ sender: UIButton) {
            UIView.animate(withDuration: 0.1, animations: {
                sender.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
            })
        }

    @objc func buttonTouchUp(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform.identity
        })
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        loadGameEngineAndHomophones()
        setupSubviews()
        setupConstraints()
    }

    // MARK: - Methods
    
    private func setupSubviews() {
        view.addSubview(collectionView)
        view.addSubview(previousButton)
        view.addSubview(nextButton)
    }
    
    private func setupConstraints() {
        let collectionViewConstrains = [
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: previousButton.topAnchor, constant: -25)
        ]
        
        let previousButtonConstrains = [
            previousButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            previousButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            previousButton.widthAnchor.constraint(equalToConstant: 50),
            previousButton.heightAnchor.constraint(equalToConstant: 70)
        ]

        let nextButtonConstrains = [
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            nextButton.widthAnchor.constraint(equalToConstant: 50),
            nextButton.heightAnchor.constraint(equalToConstant: 70)
        ]
        
        NSLayoutConstraint.activate(collectionViewConstrains)
        NSLayoutConstraint.activate(previousButtonConstrains)
        NSLayoutConstraint.activate(nextButtonConstrains)
    }
    
    private func loadGameEngineAndHomophones() {
        let savedIndex = storageManager.loadCurrentIndex()
        
        let homophonesList = HomophonesWithImagesProvider.createHomophonesWithImages(from: HomophonesProvider.homophones)
        
        homophonesGameEngine = HomophonesGameEngine(homophones: homophonesList, startIndex: savedIndex)
        currentIndex = savedIndex
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.scrollToItem(at: self.currentIndex, animated: false)
        }
    }
    
    private func scrollToItem(at index: Int, animated: Bool) {
        if index < 0 {
            currentIndex = 0
        } else if let homophonesCount = homophonesGameEngine?.homophonesList.count, index >= homophonesCount {
            currentIndex = homophonesCount - 1
        } else {
            currentIndex = index
        }
        
        storageManager.saveCurrentIndex(currentIndex)

        collectionView.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .centeredHorizontally, animated: animated)
    }
    
    @objc func previousButtonTap() {
        if currentIndex > 0 {
            scrollToItem(at: currentIndex - 1, animated: true)
        }
    }

    @objc func nextButtonTap() {
        if let gameEngine = homophonesGameEngine, currentIndex < gameEngine.homophonesList.count - 1 {
            scrollToItem(at: currentIndex + 1, animated: true)
        }
    }
    
    private func centerCardIfNeeded() {
        let contentOffsetX = collectionView.contentOffset.x
        let itemWidth = collectionView.frame.width * 0.85 + 25
        let centeredIndex = Int((contentOffsetX + itemWidth / 2) / itemWidth)
        
        if centeredIndex != currentIndex {
            scrollToItem(at: centeredIndex, animated: true)
        }
    }
}

// MARK: - Extensions

extension HomophonesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homophonesGameEngine?.homophonesList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomophoneCollectionViewCell.identifier, for: indexPath) as? HomophoneCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if let homophone = homophonesGameEngine?.homophonesList[indexPath.item] {
            cell.configure(with: homophone)
        }
        
        return cell
    }
}

extension HomophonesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width * 0.85
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
}

extension HomophonesViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        centerCardIfNeeded()
    }
}
