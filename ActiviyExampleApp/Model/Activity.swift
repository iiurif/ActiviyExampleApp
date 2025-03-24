//
//  Activity.swift
//  ActiviyExampleApp
//
//  Created by Iuri Ferreira on 17/03/25.
//

import SwiftUI
import SwiftData

@Observable
class Activity : Identifiable {
    var title : String
    var description : String
    var notes : String
    var startDate : Date
    var endDate : Date
    var isDone : Bool
    
    init(title: String, description: String, notes: String, startDate: Date, endDate: Date, isDone: Bool) {
        self.title = title
        self.description = description
        self.notes = notes
        self.startDate = startDate
        self.endDate = endDate
        self.isDone = isDone
    }
}


 
