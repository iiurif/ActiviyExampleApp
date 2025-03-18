//
//  OnboardingFlow.swift
//  ActiviyExampleApp
//
//  Created by User on 18/03/25.
//

import SwiftUI

struct OnboardingFlow : View {
    
    @State var procced : Bool = false
    
    var body: some View {
        ZStack {
            Color.brown.opacity(0.3)
                .ignoresSafeArea()
            if procced == false {
                OnboardPageTwo(procced: $procced)
                   
            } else {
                OnboardingPageThree()
                    .transition(.move(edge: .trailing))
            }
        }
    }
}

#Preview {
    OnboardingFlow()
}
