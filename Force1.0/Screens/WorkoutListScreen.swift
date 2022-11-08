//
//  WorkoutListScreen.swift
//  Force1.0
//
//  Created by Joseph William DeWeese on 11/7/22.
//

import SwiftUI
import RealmSwift


struct WorkoutListScreen: View {
    
    @ObservedResults(DailyWorkout.self) var workouts
    @State private var isPresented = false
    @State private var newWorkoutData = DailyWorkout.Data()
   
    
    var body: some View {
        List {
            ForEach(workouts) { workout in
                NavigationLink(destination: DetailScreen()) {
                    CardView()
                }
                .listRowBackground(workout.color)
            }
        }
        .navigationTitle("Daily Workouts")
    }
}

struct WorkoutListScreen_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutListScreen()
    }
}
