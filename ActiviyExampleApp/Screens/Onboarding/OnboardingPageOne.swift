//
//  OnboardingPageOne.swift
//  ActiviyExampleApp
//
//  Created by User on 18/03/25.
//

import SwiftUI

struct OnboardingPageOne: View {
    var body: some View {
        ZStack {
            Color.brown.opacity(0.3)
                .ignoresSafeArea()
            
            Image("logo")
                .resizable()
                .frame(width: 200,height: 250)
                .scaledToFit()
        }
    }
}

#Preview {
    OnboardingPageOne()
}
