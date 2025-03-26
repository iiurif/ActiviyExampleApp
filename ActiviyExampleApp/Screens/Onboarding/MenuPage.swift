

//
//  OnboardingPageFour.swift
//  ActiviyExampleApp
//
//  Created by Iuri Ferreira on 20/03/25.
//



import SwiftUI

struct MenuPage: View {
    
    @Binding var screen: ScreenState
    @State private var navigateToHome = false // State to trigger navigation
    
    var body: some View {

        NavigationStack {
            ZStack{
                VStack{
                    ZStack{
                        Image("MenuCat")
                        Text("Olá Fulano! Como Irá aproveitar seu tempo livre hoje?")
                    }.padding(.bottom, 15)
                    
                    // NavigationLink wrapped around AppButton
                    NavigationLink(destination: HomeView(), isActive: $navigateToHome) {
                        AppButton(text: "Aceitar Sugestão Aleatória") {
                            // Trigger the navigation
                            
                        }
                    }
                    .padding(.bottom, 5)
                    
                    // Another button without navigation
                    AppButton(text: "Acessar Atividades") {
                        // Your other action here
                        navigateToHome = true
                    }
                }
              
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
