//
//  HomophonesImageProvider.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 03.02.2025.
//

import UIKit

class HomophonesImageProvider {
    
    class HomophonesImage {
        let firstWordImage: String
        let secondWordImage: String
        
        init(firstWordImage: String, secondWordImage: String) {
            self.firstWordImage = firstWordImage
            self.secondWordImage = secondWordImage
        }
    }

    var homophonesImages: [HomophonesImage] = [
        HomophonesImage(firstWordImage: "WriteImage", secondWordImage: "RightImage"),
        HomophonesImage(firstWordImage: "RootImage", secondWordImage: "RouteImage"),
        HomophonesImage(firstWordImage: "WineImage", secondWordImage: "WhineImage"),
        HomophonesImage(firstWordImage: "WaitImage", secondWordImage: "WeightImage"),
        HomophonesImage(firstWordImage: "WeakImage", secondWordImage: "WeekImage"),
        HomophonesImage(firstWordImage: "BawlImage", secondWordImage: "BallImage"),
        HomophonesImage(firstWordImage: "HoleImage", secondWordImage: "WholeImage"),
        HomophonesImage(firstWordImage: "HearImage", secondWordImage: "HereImage"),
        HomophonesImage(firstWordImage: "PreyImage", secondWordImage: "PrayImage"),
        HomophonesImage(firstWordImage: "ChillyImage", secondWordImage: "ChilliImage")
        ]
    
    
}
