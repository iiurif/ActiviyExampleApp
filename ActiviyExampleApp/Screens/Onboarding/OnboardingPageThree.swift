//
//  OnboardingPageThree.swift
//  ActiviyExampleApp
//
//  Created by User on 18/03/25.
//

import SwiftUI

struct OnboardingPageThree : View {
    
    @State var username : String = ""
    
    var body : some View {
        ZStack {
            VStack {
                Image("onboard3")
                    .resizable()
                    .frame(width: 250,height: 350)
                    .scaledToFit()
                
                TextField("Digite aqui..", text: $username)
                
                
                
//                AppButton(text: "Seguir") {
//                    withAnimation {
//                        procced.toggle()
//                    }
//                }
//                .padding(.horizontal,20)
            }
        }
    }
}

#Preview {
    OnboardingPageThree()
}
