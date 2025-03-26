

//
//  OnboardingPageFour.swift
//  ActiviyExampleApp
//
//  Created by Iuri Ferreira on 20/03/25.
//



import SwiftUI

struct MenuPage: View {
    
    @AppStorage("primeiroAcesso") var firstAccess: Bool?
    @AppStorage("nome") var nome : String?
    
    @State private var navigateToHome = false
    @State private var navigateToCard = false
    
    var body: some View {
        
        NavigationStack {
            ZStack{
                Color.fundoDefault
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 40){
                    VStack{
                        Image("MenuCat")
                            .offset(y: 30)
                            .zIndex(1)
                        Text("Olá \(nome ?? "Fulano")! O que você deseja fazer agora?")
                            .foregroundStyle(.accent)
                            .fontWeight(.bold)
                            .frame(width: 248)
                            .padding(40)
                            .background(Color.ballons)
                            .clipShape(RoundedRectangle(cornerRadius: 72))
                    } //VStack
                    
                    VStack{
                       
                        NavigationLink(isActive: $navigateToCard, destination: {
                            SwipeCardView()
                        }) {
                            AppButton(text: "Acessar sugestões aleatorias"){
                                withAnimation {
                                    navigateToCard.toggle()
                                }
                            }
                        }

                        NavigationLink(isActive: $navigateToHome, destination: {
                            HomeView()
                        }) {
                            AppButton(text: "Acessar Atividades"){
                                withAnimation {
                                    navigateToHome.toggle()
                                }
                            }
                        }
                    } //VSatck
                    .padding(.horizontal, 30)
                }
            }
        }.onAppear {
            firstAccess = false
        }
    }
}

#Preview {
    MenuPage()
}
