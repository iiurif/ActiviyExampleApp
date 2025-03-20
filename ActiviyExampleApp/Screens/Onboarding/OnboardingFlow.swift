//
//  OnboardingFlow.swift
//  ActiviyExampleApp
//
//  Created by User on 18/03/25.
//

import SwiftUI

//struct OnboardingFlow : View {
//    
//    @State var procced : Bool = false
//    
//    var body: some View {
//        ZStack {
//            Color.brown.opacity(0.3)
//                .ignoresSafeArea()
//            if procced == false {
//                OnboardPageTwo(procced: $procced)
//                   
//            } else {
//                OnboardingPageThree()
//                    .transition(.move(edge: .trailing))
//            }
//        }
//    }
//}

enum ScreenState {
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
            case .one:
                OnboardPageTwo(screen: $screen)
                    .transition(.move(edge: .leading))
            case .two:
                OnboardingPageThree(screen: $screen)
                    .transition(.move(edge: .trailing))
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
