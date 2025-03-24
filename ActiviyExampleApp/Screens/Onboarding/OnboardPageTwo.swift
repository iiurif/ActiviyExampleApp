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
        NavigationStack {
            ZStack{
                Color.fundoDefault
                    .ignoresSafeArea()
                VStack {
                    Image("CatPresentation")
                    
                    AppButton(text: "Seguir") {
                        withAnimation {
                            screen = .two
                        }
                    }
                    .padding(.horizontal,30)
                }
            }
            .toolbar{
                ToolbarItem(placement: .cancellationAction)
                {
                    Button {
                        screen = .zero
                    } label: {
                        Image(systemName:"chevron.compact.backward")
                        Text("Voltar")
                            .font(.system(size: 22))
                    }

                }
                ToolbarItem(placement: .confirmationAction){
                    Button {
                        screen = .two
                    } label: {
                        Text("Pular")
                            .font(.system(size: 22))
                    }

                }
            }
        }
    }
}

#Preview {
    OnboardPageTwo(screen: .constant(.two))
}
