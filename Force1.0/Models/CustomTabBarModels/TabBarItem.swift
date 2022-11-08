//
//  TabBarItem.swift
//  Force1.0
//
//  Created by Joseph William DeWeese on 11/7/22.
//

import SwiftUI

enum TabBarItem: Hashable {
    case Settings, Workouts, Summary
    
    var iconName: String {
        switch self {
        case .Settings: return "gear"
        case .Workouts: return "figure.highintensity.intervaltraining"
        case.Summary: return "person.fill"
      
        }
    }
    var title: String {
        switch self {
        case .Settings: return "Settings"
        case .Workouts: return "Workouts"
        case.Summary: return "Summary"
      
        }
    }
    var color: Color {
        switch self {
        case .Settings: return Color.blue
        case .Workouts: return Color.orange
        case.Summary: return Color.blue
        
            }
        }
    }


