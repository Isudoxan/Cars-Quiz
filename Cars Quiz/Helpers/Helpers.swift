//
//  Helpers.swift
//  Cars Quiz
//
//  Created by Danylo Liubyi on 29.01.2025.
//

import UIKit

func hapticFeedbackSuccess() {
    UINotificationFeedbackGenerator().notificationOccurred(.success)
}

func hapticFeedbackError() {
    UINotificationFeedbackGenerator().notificationOccurred(.error)
}
