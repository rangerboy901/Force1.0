//
//  HapticManager.swift
//  Force1.0
//
//  Created by Joseph Wil;liam DeWeese on 11/7/22.
//

import SwiftUI

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}

