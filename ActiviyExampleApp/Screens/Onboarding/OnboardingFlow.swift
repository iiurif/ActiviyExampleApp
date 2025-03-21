//  Created by User on 18/03/25.

/*
 Esse arquivo ele é apenas um fluxo que controla a view que irá aparecer em seguida. Ele é uma view que carrega uma view.
 */

import SwiftUI

enum ScreenState {
    case zero
    case one
    case two
    case three
    case four
}

struct OnboardingFlow : View {
    
    @State var screen : ScreenState 
    
    var body: some View {
        ZStack {
            Color.brown.opacity(0.3)
                .ignoresSafeArea()
                
            switch screen {
            case .zero:
                AppExplanation(screen: $screen)
                    .transition(.move(edge: .leading))
            case .one:
                OnboardPageTwo(screen: $screen)
                    .transition(.move(edge: .leading))
            case .two:
                OnboardingPageThree(screen: $screen)
                    .transition(.move(edge: .leading))
            case .three:
                OnboardingPageFour(screen: $screen)
                    .transition(.opacity)
            case .four:
                HomeView()
                    .transition(.opacity)
            }
        }
    }
}

#Preview {
    //OnboardingFlow()
}
