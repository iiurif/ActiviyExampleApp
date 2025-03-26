//
//  OnboardingPageFour.swift
//  ActiviyExampleApp
//
//  Created by Iuri Ferreira on 20/03/25.
//


import SwiftUI

struct MenuPage: View {
    
    @Binding var screen : ScreenState
    
    var body: some View {
        ZStack{
            VStack(spacing: 40){
                VStack{
                    Image("MenuCat")
                        .offset(y: 30)
                        .zIndex(1)
                    Text("Olá Fulano! O que você deseja fazer agora?")
                        .foregroundStyle(.accent)
                        .fontWeight(.bold)
                        .frame(width: 248)
                        .padding(40)
                        .background(Color.ballons)
                        .clipShape(RoundedRectangle(cornerRadius: 72))
                } //VStack
                
                VStack{
                    AppButton(text: "Aceitar sugestões aleatórias"){
                        withAnimation {
                            
                        }
                    }
                    .padding(.vertical, 10)
                    
                    AppButton(text: "Acessar Atividades"){
                        withAnimation {
                            
                        }
                    }
                } //VSatck
                .padding(.horizontal, 30)
            }
        }
    }
}

#Preview {
    MenuPage(screen: .constant(.three))
}
