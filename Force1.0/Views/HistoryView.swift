//
//  HistoryView.swift
//  Force1.0
//
//  Created by Joseph Wil;liam DeWeese on 11/7/22.
//

import SwiftUI

struct HistoryView: View {
    let history: History
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                Text("Exercises")
                    .font(.headline)
                Text(history.exerciseString)
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
}

extension History {
    var exerciseString: String {
        ListFormatter.localizedString(byJoining: exercises)
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HistoryView(history: History(exercises: ["Jon", "Darla", "Luis"], lengthInMinutes: 10))
        }
    }
}

