//
//  OnboardingPageZero.swift
//  ActiviyExampleApp
//
//  Created by found on 21/03/25.
//

import SwiftUI

struct AppExplanation: View {
    
    @Binding var screen: ScreenState
    
    var body: some View {
        VStack{
            Text("Finalmente fazendo algo sua inutil")
            Text("Não diga isso, ta todo mundo igual ! Você é massa !")
            Button {
                screen = .one
            } label: {
                Text("Avançar")
            }
        }
        
    }
}

#Preview {
   //AppExplanation()
}
