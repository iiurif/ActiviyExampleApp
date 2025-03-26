import SwiftUI
import SwiftData

@main
struct ActiviyExampleAppApp: App {
    
    // Using @AppStorage to store and persist the "primeiroAcesso" value
    @AppStorage("primeiroAcesso") var firstAccess: Bool = true
    
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
            if firstAccess {
                OnboardingView()
                    .modelContainer(sharedModelContainer)
                    .preferredColorScheme(.light)
            } else {
                MenuPage()
                    .modelContainer(sharedModelContainer)
                    .preferredColorScheme(.light)
            }
        }
    }
}

