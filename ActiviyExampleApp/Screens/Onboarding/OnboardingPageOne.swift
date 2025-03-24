//
//  OnboardingPageOne.swift
//  ActiviyExampleApp
//
//  Created by User on 18/03/25.
//

//INUTILLLLLLLLLLLLLLLLLLLL

import SwiftUI

struct OnboardingPageOne: View {
    var body: some View {
        ZStack {
            Image("AppLogo")
                .resizable()
                .frame(width: 200,height: 275)
                .scaledToFit()
        }
    }
}

#Preview {
    OnboardingPageOne()
}
