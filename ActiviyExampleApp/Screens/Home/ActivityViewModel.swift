//
//  ActivityViewModel.swift
//  ActiviyExampleApp
//
//  Created by User on 24/03/25.
//

import SwiftUI

class ActivityViewModel : ObservableObject {
    @Published var activities : [Activity] = []
    
    func addActvitiy(_ activity:Activity) {
        activities.append(activity)
    }
}
