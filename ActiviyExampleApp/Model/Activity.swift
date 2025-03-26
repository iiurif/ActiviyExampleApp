//
//  Activity.swift
//  ActiviyExampleApp
//
//  Created by Iuri Ferreira on 17/03/25.
//

import SwiftUI
import SwiftData

@Model
class Activity {
    var title: String
    var desc: String
    var notes: String
    var startDate: Date
    var endDate: Date
    var isDone: Bool
    
    private var categoryRawValue: String
    
    var category: Category {
        get { Category(rawValue: categoryRawValue) ?? .outros }
        set { categoryRawValue = newValue.rawValue }
    }

    init(title: String, description: String, notes: String, startDate: Date, endDate: Date, isDone: Bool, category: Category) {
        self.title = title
        self.desc = description
        self.notes = notes
        self.startDate = startDate
        self.endDate = endDate
        self.isDone = isDone
        self.categoryRawValue = category.rawValue
    }
}


 
