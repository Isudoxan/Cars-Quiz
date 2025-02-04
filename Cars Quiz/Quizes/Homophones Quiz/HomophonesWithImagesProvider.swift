//
//  HomophonesImageProvider.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 03.02.2025.
//

import UIKit

class HomophonesWithImagesProvider {
    
    static func createHomophonesWithImages(from homophones: [Homophon]) -> [HomophoneWithImage] {
        let homophonesWithImages = homophones
            .map { homophone in
            let firstWordImage = UIImage(named: homophone.firstWordImageName)
            let secondWordImage = UIImage(named: homophone.secondWordImageName)
            
            let homophoneWithImage = HomophoneWithImage(
                homophone: homophone,
                firstWordImage: firstWordImage,
                secondWordImage: secondWordImage
            )
            
            return homophoneWithImage
        }
        
        return homophonesWithImages
    }
}
