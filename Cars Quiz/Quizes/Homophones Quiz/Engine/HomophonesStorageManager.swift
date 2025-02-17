//
//  HomophonesStorageManager.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 09.02.2025.
//

import Foundation

class HomophonesStorageManager {
    private let indexKey = "currentHomophoneIndex"

    func saveCurrentIndex(_ index: Int) {
        UserDefaults.standard.set(index, forKey: indexKey)
    }

    func loadCurrentIndex() -> Int {
        return UserDefaults.standard.integer(forKey: indexKey)
    }
}
