//
//  EditScreen.swift
//  Force1.0
//
//  Created by Joseph Wil;liam DeWeese on 11/8/22.
//

import SwiftUI

struct EditScreen: View {
 //MARK:  PROPERTIES
    @Binding var workoutData: DailyWorkout.Data
    
    let workoutType = ["Strength", "Power", "Cardio", "HIIT", "Recover"]
    @State private var newExercise = ""
    
    var body: some View {
        
        List {
            
            Section(header: Text("Add/Edit Workout Details⇩").fontWeight(.bold).foregroundColor(.accentColor)) {
                
                TextField("Enter Workout Name...", text: $workoutData.title)
                    .padding()
                    .background(Color(UIColor.tertiarySystemFill))
                    .lineLimit(1)
                    .minimumScaleFactor(0.2)
                    .cornerRadius(10)
                    .foregroundColor(.primary)
            }
                Section(header: Text("Add/Edit Workout Objective⇩").fontWeight(.bold).foregroundColor(.accentColor)) {
                    TextEditor(text: $workoutData.objective)
                        .frame(width: 350, height: 125, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .lineLimit(5)
                }
                .padding(2)
                .background(Color(UIColor.tertiarySystemFill))
                .cornerRadius(10)
                .foregroundColor(.primary)
                .accessibilityLabel("\(workoutData.objective)")
            
            Section(header: Text("Choose Workout Type:")){
                Picker("Workout Type:", selection: $workoutData.workoutType) {
                    ForEach(workoutType, id: \.self) {
                        Text($0)
                    }
                    .padding()
                }
                .pickerStyle(SegmentedPickerStyle())
                .foregroundColor(.primary)
            }
            ///workout goal slider
            Section("Time Goal") {
                HStack {
                    Slider(value: $workoutData.lengthInMinutes, in:1...180, step: 1){
                        Text("\(Int(workoutData.lengthInMinutes)) min(s)")
                        
                    }
                    .accessibilityValue("\(Int(workoutData.lengthInMinutes)) min(s)")
                    
                    Text("\(Int(workoutData.lengthInMinutes)) min(s).")
                        .accessibilityHidden(true)
                }
            }
            ///EXERCISES
            Section(header: Text("Add/Delete Exercises")) {
                ForEach(workoutData.exercises, id: \.self) { exercise in
                    Text(exercise)
                }
                .onDelete { indices in
                    workoutData.exercises.remove(atOffsets: indices)
                }
                HStack {
                    TextField("Enter New Exercise...", text: $newExercise)
                    Button(action: {
                        HapticManager.notification(type: .success)
                        withAnimation {
                            workoutData.exercises.append(newExercise)
                            newExercise = ""
                        }
                       
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add exercise")
                    }
                    .disabled(newExercise.isEmpty)
                    .foregroundColor(.accentColor)
                    
                }
            }//#endOf Section
        }
        .listStyle(InsetListStyle())
        .foregroundColor(.accentColor)
    }
}

struct EditScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditScreen(workoutData: .constant(DailyWorkout.data[0].data))
    }
}
