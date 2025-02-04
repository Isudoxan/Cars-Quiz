//
//  HomophoneWithImage.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 03.02.2025.
//

import UIKit

/// Composition pattern.
class HomophoneWithImage {
    let homophone: Homophon
    let firstWordImage: UIImage?
    let secondWordImage: UIImage?
    
    init(homophone: Homophon, firstWordImage: UIImage?, secondWordImage: UIImage?) {
        self.homophone = homophone
        self.firstWordImage = firstWordImage
        self.secondWordImage = secondWordImage
    }
}
