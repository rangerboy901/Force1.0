//
//  WorkoutListScreen.swift
//  Force1.0
//
//  Created by Joseph William DeWeese on 11/7/22.
//

import SwiftUI
import RealmSwift


struct WorkoutListScreen: View {
    //MARK: PROPERTIES
    @ObservedResults(DailyWorkout.self) var workouts
    @State private var isPresented = false
    @State private var newWorkoutData = DailyWorkout.Data()
    @State private var currentWorkout = DailyWorkout()
    @State private var workoutType: String = "Strength"
    
    
    let types = ["Strength", "Power", "Cardio", "HIIT", "Recover"]
    
    var body: some View {
        NavigationView {
            List {
                if let workouts = workouts {
                    ForEach(workouts) { workout in
                        NavigationLink(destination: DetailScreen()) {
                            CardView(workout: workout)
                        }
                        .listRowBackground(workout.color)
                    }
                }
            }
            .navigationTitle("Daily Workouts")
            .navigationBarItems(
                trailing:
                AddWorkoutButton())
        }
      
            
        }
    }

struct WorkoutListScreen_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutListScreen()
    }
}
