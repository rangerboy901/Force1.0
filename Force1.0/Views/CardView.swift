//
//  CardView.swift
//  Force1.0
//
//  Created by Joseph William DeWeese on 11/7/22.
//

import SwiftUI

struct CardView: View {
    //MARK:  PROPERTIES
    let workout: DailyWorkout
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(workout.title)
                .foregroundColor(.accentColor)
                .accessibilityAddTraits(.isHeader)
                .font(.title2)
                .fontWeight(.bold)
                
            Spacer()
            Text(workout.objective)
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(.accentColor)
            Spacer()
            
            HStack {
                Label("Goal:  \(workout.lengthInMinutes) min(s)", systemImage: "stopwatch.fill")
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Exercises"))
                    .accessibilityValue(Text("\(workout.exercises.count) "))
                Spacer()
                Text("\(workout.workoutType)")
                    .padding(4)
                    .foregroundColor(.accentColor)
                    .accessibilityLabel("Workout type\(workout.workoutType) ")
                    .font(.body)
                    .overlay(
                        Capsule().stroke(workout.color.accessibleFontColor, lineWidth: 2))
            }.foregroundColor(.accentColor)
            
        }
        .padding(2)
        .cornerRadius(10)
        .foregroundColor(workout.color.accessibleFontColor)

    }
       
    
}
struct CardView_Previews: PreviewProvider {
    static var workout = DailyWorkout.data[0]
    static var previews: some View {
        CardView(workout: workout)
            .background(workout.color)
    
            .previewLayout(.fixed(width: 350, height: 100))
    }
}
