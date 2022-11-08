//
//  History.swift
//  Force1.0
//
//  Created by Joseph William DeWeese on 11/7/22.
//

import Foundation
import RealmSwift

class History: EmbeddedObject, ObjectKeyIdentifiable {
    @Persisted var date: Date?
    @Persisted var exerciseList = List<String>()
    @Persisted var lengthInMinutes: Int = 0
    var exercises: [String] { Array(exerciseList)}
    
    convenience init(date: Date = Date(), exercises: [String], lengthInMinutes: Int) {
        self.init()
        self.date = date
        exerciseList.append(objectsIn: exercises)
        self.lengthInMinutes = lengthInMinutes
        
    }
}
