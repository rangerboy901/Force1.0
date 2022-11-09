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
                .foregroundColor(workout.color.accessibleFontColor)
                .accessibilityAddTraits(.isHeader)
                .font(.title2)
                .fontWeight(.bold)
                
            Spacer()
            Text(workout.objective)
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            Spacer()
            
            HStack {
                Label("Goal:  \(workout.lengthInMinutes) min(s)", systemImage: "stopwatch.fill")
                    .foregroundColor(workout.color.accessibleFontColor)
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Exercises"))
                    .accessibilityValue(Text("\(workout.exercises.count) "))
                Spacer()
                Text("\(workout.workoutType)")
                    .padding(5)
                    .font(.body)
                    .foregroundColor(workout.color.accessibleFontColor)
                    .accessibilityLabel("Workout type\(workout.workoutType) ")
                    .overlay(
                        Capsule().stroke(workout.color.accessibleFontColor, lineWidth: 3))
            }
            .foregroundColor(.primary)
            
        }
        .padding(2)
        .cornerRadius(10)
        .foregroundColor(.primary)

    }
       
    
}
struct CardView_Previews: PreviewProvider {
    static var workout = DailyWorkout.data[0]
    static var previews: some View {
        CardView(workout: workout)
            .background(workout.color)
            .previewLayout(.sizeThatFits)
            .previewLayout(.fixed(width: 350, height: 100))
    }
}
