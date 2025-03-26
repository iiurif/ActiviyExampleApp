//  Created by User on 18/03/25.

/*
 Esse arquivo é apenas um fluxo que controla a view que irá aparecer em seguida.
 Ele é uma view que carrega uma view.
 */

import SwiftUI

enum ScreenState {

    case zero, one, two, three
}

struct OnboardingFlow: View {
    
    @State var screen: ScreenState
    
    var body: some View {
        ZStack {
            Color.fundoDefault
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
                MenuPage(screen: $screen)
                    .transition(.opacity)
            }
        }
    }
}

#Preview {
    OnboardingFlow()
}
