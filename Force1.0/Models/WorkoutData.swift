//
//  WorkoutData.swift
//  Force1.0
//
//  Created by Joseph Wil;liam DeWeese on 11/7/22.
//

import Foundation

class WorkoutData: ObservableObject {
    private static var documentsFolder: URL {
        do {
            return try FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask,
                                               appropriateFor: nil,
                                               create: false)
        } catch {
            fatalError("Can't find documents directory.")
        }
    }
    private static var fileURL: URL {
        return documentsFolder.appendingPathComponent("workouts.data")
    }
    @Published var workouts: [DailyWorkout] = []
    
        func load() {
            DispatchQueue.global(qos: .background).async { [weak self] in
                guard let data = try? Data(contentsOf: Self.fileURL) else {
                    #if DEBUG
                    DispatchQueue.main.async {
                        self?.workouts = DailyWorkout.data
                    }
                    #endif
                    return
                }
                guard let dailyWorkouts = try? JSONDecoder().decode([DailyWorkout].self, from: data)
                else{
                    fatalError("Can't decode saved workout data.")
                }
                DispatchQueue.main.async {
                    self?.workouts = dailyWorkouts
                }
            }
        }
    
        func save() {
            DispatchQueue.global(qos: .background).async { [weak self] in
                guard let workouts = self?.workouts else { fatalError("Self out of scope") }
                guard let data = try? JSONEncoder().encode(workouts) else { fatalError("Error encoding data") }
                do {
                    let outfile = Self.fileURL
                    try data.write(to: outfile)
                } catch {
                    fatalError("Can't write to file")
                }
            }
        }
    }
    

