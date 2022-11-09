//
//  DetailScreen.swift
//  Force1.0
//
//  Created by Joseph William DeWeese on 11/7/22.
//

import SwiftUI
import RealmSwift

struct DetailScreen: View {
    //MARK:  PROPERTIES
    @ObservedRealmObject var  workout: DailyWorkout
    
    @State private var data = DailyWorkout.Data()
    @State private var isPresented = false
    
    
    var body: some View {
        
        List {
            
            Section(header: Text("Workout Objective or Description").fontWeight(.bold)){
                Text(workout.objective)
            }
            ///Type
            Section(header: Text("Workout Type").fontWeight(.bold)) {
                HStack {
                    Text("Workout Type: \(workout.workoutType)")
                }
                .accessibilityElement(children: .combine)
            }
            if workout.exercises.count >= 1 {
                Section(header: Text("Exercises").fontWeight(.bold)) {
                    ForEach(workout.exercises, id: \.self) { exercise in
                        Label(exercise, systemImage: "person")
                            .accessibilityLabel(Text("Person"))
                            .accessibilityValue(Text(exercise))
                    }
                }
            }
            Section(header: Text("Workout Time Limit or Goal").fontWeight(.bold)) {
                HStack {
                    Label("Goal:", systemImage: "clock")
                    Spacer()
                    Text("\(workout.lengthInMinutes) min(s)")
                        .padding(4)
                        .foregroundColor(workout.color.accessibleFontColor)
                        .background(workout.color)
                        .cornerRadius(10)
                }
                .accessibilityElement(children: .combine)
            }
            .padding(.bottom, 2)
            Section(header: Text("Theme Color")) {
                HStack {
                    Label("Color", systemImage: "paintpalette")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(workout.color)
                }
                .accessibilityElement(children: .ignore)
                
                
                ///Start Workout
                NavigationLink(destination: GymView()) {
                    Label("Begin Workout", systemImage: "timer")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.primary)
                        .background(workout.color)
                        .cornerRadius(10)
                }
                
                Section(header: Text("Workout History & Journals").fontWeight(.bold)) {
                    if workout.history.isEmpty {
                        Label("No workouts logged.", systemImage: "calendar.badge.exclamationmark")
                    }
                    ForEach(workout.history) { history in
                        NavigationLink(destination: HistoryView(history: history)) {
                            HStack {
                                Image(systemName: "calendar")
                                Text(history.date!, style: .date)
                            }
                        }
                    }
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle(workout.title)
        .navigationBarItems(trailing: Button("Edit") {
            isPresented = true
            data = workout.data
        })
        
        .sheet(isPresented: $isPresented) {
            NavigationView {
                EditScreen(workoutData: $data)
                    .navigationTitle("test")
                    .toolbar {
                        ///Cancel
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                HapticManager.notification(type: .success)
                                isPresented = false
                            }
                        }///Save
                        ToolbarItem(placement: .confirmationAction) {
                            Button("SAVE") {
                                HapticManager.notification(type: .success)
                                isPresented = false
                                do {
                                    try Realm().write() {
                                        guard let thawedWorkout = workout.thaw() else {
                                            print("Unable to thaw workout")
                                            return
                                        }
                                        thawedWorkout.update(from: data)
                                    }
                                } catch {
                                    print("Failed to save workout: \(error.localizedDescription)")
                                }
                            }
                        }
                    }
            }
        }
    }
}
struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(workout: DailyWorkout.data[0])
    }
}
