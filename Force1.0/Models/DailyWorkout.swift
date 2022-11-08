//
//  DailyWorkout.swift
//  Force1.0
//
//  Created by Joseph Wil;liam DeWeese on 11/7/22.
//

import SwiftUI
import RealmSwift

class DailyWorkout: Object, ObjectKeyIdentifiable {
  
    @Persisted  var title = ""
    @Persisted var objective = ""
    @Persisted var workoutType = "Strength"
    @Persisted var lengthInMinutes = 0
    @Persisted var exerciseList = RealmSwift.List<String>()
    @Persisted var colorComponents: Components?
    @Persisted var historyList = RealmSwift.List<History>()
    
    var color: Color { Color(colorComponents ?? Components()) }
    var exercises: [String] { Array(exerciseList) }
    var history: [History] { Array(historyList) }
    
    
    convenience init(title: String, objective: String, workoutType: String, exercises: [String], lengthInMinutes: Int, color: Color, history: [History] = []) {
        self.init()
        self.title = title
        self.objective = objective
        exerciseList.append(objectsIn: exercises)
        self.lengthInMinutes = lengthInMinutes
        self.workoutType = workoutType
        self.colorComponents = color.components
        for entry in history {
            self.historyList.insert(entry, at: 0)
        }
    }
}

extension DailyWorkout {
    static var data: [DailyWorkout]{
        [
            DailyWorkout(title: "Remington", objective: "Complete as Rx'd for time.", workoutType: "HIIT", exercises: ["Warm-up", "25 Push-ups","50 Sit-ups","10 Pull-ups","40 Meter sprint"], lengthInMinutes: 5, color: .accentColor),
            DailyWorkout(title: "Montana", objective: "Complete as Rx'd for time.", workoutType: "Strength", exercises: ["Warm-up", "25 Push-ups","50 Sit-ups","10 Pull-ups","40 Meter sprint"], lengthInMinutes: 5, color: .accentColor),
            DailyWorkout(title: "Cooper", objective: "4 Rounds for time.", workoutType: "Power", exercises: ["Warm-up", "25 Push-ups","50 Sit-ups","10 Pull-ups","40 Meter sprint"], lengthInMinutes: 5, color: .accentColor),
            DailyWorkout(title: "Hayven", objective: "Complete as Rx'd for time.", workoutType: "Cardio", exercises: ["Warm-up", "25 Push-ups","50 Sit-ups","10 Pull-ups","40 Meter sprint"], lengthInMinutes: 5, color: .accentColor),
            DailyWorkout(title: "Marz", objective: "4 Rounds for time.", workoutType: "Recover", exercises: ["Warm-up", "25 Push-ups","50 Sit-ups","10 Pull-ups","40 Meter sprint"], lengthInMinutes: 5, color: .accentColor),
            DailyWorkout(title: "Dakota", objective: "4 Rounds for time.", workoutType: "Stretch", exercises: ["Warm-up", "25 Push-ups","50 Sit-ups","10 Pull-ups","40 Meter sprint"], lengthInMinutes: 10, color:  .accentColor),
        ]
    }
}
extension DailyWorkout {
    struct Data {
        var title: String = ""
        var objective: String = ""
        var exercises: [String] = []
        var lengthInMinutes: Double = 1.0
        var workoutType: String = ""
        var color: Color = .accentColor
    }

    var data: Data {
        return Data(title: title, objective: objective, exercises: exercises, lengthInMinutes: Double(lengthInMinutes), workoutType: workoutType, color: color)
    }
    
    func update(from data: Data) {
        title = data.title
        objective = data.objective
        for exercise in data.exercises{
            if !exercises.contains(exercise) {
                self.exerciseList.append(exercise)
            }
        }
        lengthInMinutes = Int(data.lengthInMinutes)
        colorComponents = data.color.components
    }
}

