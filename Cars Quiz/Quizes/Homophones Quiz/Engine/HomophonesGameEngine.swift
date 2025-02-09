//
//  HomophonesGameEngine.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 03.02.2025.
//

import Foundation

class HomophonesGameEngine {
    
    // MARK: - Properties
    
    private var homophonesList: [HomophoneWithImage]
    private var currentHomophoneIndex: Int
    
    var currentHomophone: HomophoneWithImage {
        return homophonesList[currentHomophoneIndex]
    }
    
    private let progressFileName = "HomophonesProgress.json"
    
    // MARK: - Lifecycle
    
    init(homophones: [HomophoneWithImage]) {
        self.homophonesList = homophones
        self.currentHomophoneIndex = 0
        self.currentHomophoneIndex = loadCurrentIndex()
    }
    
    // MARK: - Methods
    
    func nextHomophone() {
        if currentHomophoneIndex < homophonesList.count - 1 {
            currentHomophoneIndex += 1
            saveCurrentIndex()
        }
    }
    
    func previousHomophone() {
        if currentHomophoneIndex > 0 {
            currentHomophoneIndex -= 1
            saveCurrentIndex()
        }
    }
    
    // MARK: - Persistence
    
    private func saveCurrentIndex() {
        let fileURL = getFileURL()
        do {
            let data = try JSONEncoder().encode(currentHomophoneIndex)
            try data.write(to: fileURL, options: .atomic)
        } catch {
            print("❌ Error saving index: \(error)")
        }
    }
    
    private func loadCurrentIndex() -> Int {
        let fileURL = getFileURL()
        
        if !FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                let initialData = try JSONEncoder().encode(0)
                try initialData.write(to: fileURL, options: .atomic)
                return 0
            } catch {
                print("❌ Error creating initial file: \(error)")
                return 0
            }
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            return try JSONDecoder().decode(Int.self, from: data)
        } catch {
            print("⚠️ Error loading index, starting from 0: \(error)")
            return 0
        }
    }
    
    private func getFileURL() -> URL {
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return directory.appendingPathComponent(progressFileName)
    }
}
