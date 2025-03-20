//
//  OnboardingPageThree.swift
//  ActiviyExampleApp
//
//  Created by User on 18/03/25.
//

import SwiftUI

struct OnboardingPageThree : View {
    
    @Binding var screen : ScreenState
    @State var username : String = ""
    
    var body : some View {
        ZStack {
            VStack {
                Image("onboard3")
                    .resizable()
                    .frame(width: 250,height: 350)
                    .scaledToFit()
                
                HStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(Color.white)
                        .frame(height: 55)
                        .overlay {
                            HStack {
                                TextField("Digite aqui..", text: $username)
                                    .padding(.leading,10)
                            }
                        }.padding()
                    
                    if self.username != "" {
                        circleButton
                    }
                }
            }
        }
    }
    
    private var circleButton : some View {
        
        Button {
            User.shared.setName(username)
            screen = .three
        } label: {
            Circle()
                .foregroundStyle(.background)
                .frame(width: 53, height: 53, alignment: .center)
                .padding(.trailing)
                .overlay {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                        .offset(x:-8)
                }
        }
    }
}

#Preview {
    OnboardingPageThree(screen: .constant(.three))
}
