//
//  OnboardPage2.swift
//  ActiviyExampleApp
//
//  Created by User on 18/03/25.
//

import SwiftUI

struct OnboardPageTwo: View {
    
    @Binding var screen : ScreenState
    
    var body: some View {
        ZStack {
            VStack {
                Image("catboard1")
                    .resizable()
                    .frame(width: 250,height: 350)
                    .scaledToFit()
                
                AppButton(text: "Seguir") {
                    withAnimation {
                        screen = .two
                    }
                }
                .padding(.horizontal,20)
            }
        }
    }
}

#Preview {
    //OnboardPageTwo()
}
