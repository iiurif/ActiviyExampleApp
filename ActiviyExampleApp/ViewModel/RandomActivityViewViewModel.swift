//
//  ActivityViewViewModel.swift
//  ActiviyExampleApp
//
//  Created by Iuri Ferreira on 17/03/25.
//

import Foundation

class RandomActivityViewViewModel : ObservableObject {
    
    @Published var activityList : [RandomActivity] = []
    @Published var randomActivity : RandomActivity? = nil
    
    @Published var username : String = ""
    
    init() {
        loadActivities()
        getRandomActivity()
        self.username = User.shared.name
    }
    
    func loadActivities() {
        guard let activity = Bundle.main.url(forResource: "activities", withExtension: "json") else { return }
        do {
            let jsonData = try Data(contentsOf: activity)
            let result = try JSONDecoder().decode(RandomActivityResponse.self, from: jsonData)
            self.activityList = result.activities
        } catch {
            print("\(error)")
        }
    }
    
    func getRandomActivity() {
        randomActivity = activityList.randomElement()
    }
}
