import UIKit

class WordImageView {
    
    // MARK: - UI Components
    
    let view = UIView()
    let wordENLAbel = UILabel()
    let wordUALAbel = UILabel()
    let wordImage = UIImageView()
    
    // MARK: - Init
    
    init() {
        setupElements()
        setupConstraints()
    }
    
    // MARK: - Methods
    
    private func setupElements() {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        wordENLAbel.translatesAutoresizingMaskIntoConstraints = false
        wordENLAbel.textColor = .blue
        wordENLAbel.font = .boldSystemFont(ofSize: 20)
        
        wordUALAbel.translatesAutoresizingMaskIntoConstraints = false
        wordUALAbel.textColor = .black
        wordUALAbel.font = .systemFont(ofSize: 15)
        
        wordImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(wordENLAbel)
        view.addSubview(wordUALAbel)
        view.addSubview(wordImage)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            wordENLAbel.topAnchor.constraint(equalTo: view.topAnchor),
            wordENLAbel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            wordENLAbel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            wordUALAbel.topAnchor.constraint(equalTo: wordENLAbel.bottomAnchor, constant: 5),
            wordUALAbel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            wordUALAbel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            wordImage.topAnchor.constraint(equalTo: wordUALAbel.bottomAnchor, constant: 5),
            wordImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            wordImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            wordImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func configure(wordEN: String, wordUA: String, image: UIImage?) {
        wordENLAbel.text = wordEN
        wordUALAbel.text = wordUA
        wordImage.image = image
    }
}
