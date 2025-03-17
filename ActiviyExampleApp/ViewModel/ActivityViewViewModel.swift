//
//  ActivityViewViewModel.swift
//  ActiviyExampleApp
//
//  Created by Iuri Ferreira on 17/03/25.
//

import Foundation

class ActivityViewViewModel : ObservableObject {
    @Published var activityList : [Activity] = []
    
    init() {
        fetchActivity()
    }
    
    func fetchActivity() {
        guard let activity = Bundle.main.url(forResource: "activities", withExtension: "json") else { return }
        do {
            let jsonData = try Data(contentsOf: activity)
            print(jsonData)
        } catch {
            
        }
    }
}
