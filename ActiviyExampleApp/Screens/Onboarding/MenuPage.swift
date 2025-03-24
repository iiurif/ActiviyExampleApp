//
//  OnboardingPageFour.swift
//  ActiviyExampleApp
//
//  Created by Iuri Ferreira on 20/03/25.
//

//Pagina Para Segundo Acesso (Mudar nome urgente!!!!)

import SwiftUI

struct MenuPage: View {
    
    @Binding var screen : ScreenState
    
    var body: some View {
        ZStack{
            VStack{
                ZStack{
                    Image("MenuCat")
                    Text("Olá Fulano! Como Irá aproveitar seu tempo livre hoje?")
                }.padding(.bottom, 15)
                AppButton(text: "Aceitar Sugestão Aleatória"){
                    
                }.padding(.bottom, 5)
                AppButton(text: "Acessar Atividades"){
                    
                }
            }
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    MenuPage(screen: .constant(.three))
}
