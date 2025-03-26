//
//  ActiviyExampleAppApp.swift
//  ActiviyExampleApp
//
//  Created by Iuri Ferreira on 17/03/25.
//

import SwiftUI
import SwiftData

@main
struct ActiviyExampleAppApp: App {
    
    var sharedModelContainer: ModelContainer = {
        do {
            let container = try ModelContainer(for: Activity.self) // ✅ Corrected
            return container
        } catch {
            fatalError("❌ Failed to initialize ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .modelContainer(sharedModelContainer)
                .preferredColorScheme(.light)
        }
    }
}
