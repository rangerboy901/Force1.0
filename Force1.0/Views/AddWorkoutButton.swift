//
//  AddWorkoutButton.swift
//  Force1.0
//
//  Created by Joseph Wil;liam DeWeese on 11/8/22.
//

import SwiftUI
import RealmSwift


struct AddWorkoutButton: View {
    @ObservedResults(DailyWorkout.self) var workouts
    @State private var isPresented: Bool = false
    @State private var newWorkoutData = DailyWorkout.Data()
    @State private var currentWorkout = DailyWorkout()
    @State private var workoutType: String = "Strength"
    
    
    var body: some View {
        
        ZStack {
            Group {
                
                Circle()
                    .fill(Color("orange"))
                    .frame(width: 38, height: 38, alignment: .center)
                Circle()
                    .fill(Color("blue"))
                    .frame(width: 32, height: 32, alignment: .center)
                Circle()
                    .fill(Color("white"))
                    .frame(width: 22, height: 22, alignment: .center)
                
                Button(action: {
                    HapticManager.notification(type: .success)
                    isPresented = true
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color("orange"))
                        .frame(width: 28, height: 28, alignment: .center)
                        .padding(.trailing, 8)
                }
                .padding()
                .sheet(isPresented: $isPresented) {
                    NavigationView {
                        EditScreen(workoutData: $newWorkoutData)
                            .navigationBarItems(leading: Button("Dismiss") {
                                isPresented = false
                            }, trailing: Button("Add") {
                                let newWorkout = DailyWorkout(
                                    title: newWorkoutData.title,
                                    objective: newWorkoutData.objective,
                                    workoutType: newWorkoutData.workoutType,
                                    exercises: newWorkoutData.exercises,
                                    lengthInMinutes: Int(newWorkoutData.lengthInMinutes),
                                    color: newWorkoutData.color)
                                $workouts.append(newWorkout)
                                isPresented = false
                            })
                    }
                }
            }
        }
    }
}
struct AddWorkoutButton_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkoutButton()
    }
}
