//
//  ActiviyExampleAppApp.swift
//  ActiviyExampleApp
//
//  Created by Iuri Ferreira on 17/03/25.
//

import SwiftUI

@main
struct ActiviyExampleAppApp: App {
    
    let activityViewModel : ActivityViewModel = ActivityViewModel()
    
    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .environmentObject(activityViewModel)
                .preferredColorScheme(.light)
        }
    }
}
