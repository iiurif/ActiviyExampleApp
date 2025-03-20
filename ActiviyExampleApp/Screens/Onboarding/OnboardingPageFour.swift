//
//  OnboardingPageFour.swift
//  ActiviyExampleApp
//
//  Created by Iuri Ferreira on 20/03/25.
//

import SwiftUI

struct OnboardingPageFour: View {
    
    @Binding var screen : ScreenState
    
    var body: some View {
        VStack {
            Image("cat_blank")
                .resizable()
                .frame(width: 250,height: 350)
                .overlay {
                    VStack {
                        Text("Olá \(User.shared.name)!")
                        Text("Vamos aproveitar")
                        Text("seu tempo livre ?")

                    }
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.brown)
                    .offset(y:25)
                }
            
            AppButton(text: "Continuar") {
                withAnimation {
                    self.screen = .four
                }
                
            }.padding()
        }
    }
}

#Preview {
    OnboardingPageFour(screen: .constant(.four))
}
