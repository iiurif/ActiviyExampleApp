//  Created by User on 18/03/25.

/*
 Esse arquivo é apenas um fluxo que controla a view que irá aparecer em seguida.
 Ele é uma view que carrega uma view.
 */

import SwiftUI

enum ScreenState {
    case zero, one, two, three, four
}

struct OnboardingFlow: View {
    
    @State private var screen: ScreenState = .zero
    
    var body: some View {
        ZStack {
            Color.brown.opacity(0.3)
                .ignoresSafeArea()
            
            switch screen {
            case .zero:
                AppExplanation(screen: $screen)
                    .transition(.move(edge: .trailing))
            case .one:
                OnboardPageTwo(screen: $screen)
                    .transition(.move(edge: .leading))
            case .two:
                OnboardingPageThree(screen: $screen)
                    .transition(.move(edge: .trailing))
            case .three:
                OnboardingPageFour(screen: $screen)
            case .four:
                NavigationStack {
                    HomeView()
                }
            }
        }
    }
}

#Preview {
    OnboardingFlow()
}
