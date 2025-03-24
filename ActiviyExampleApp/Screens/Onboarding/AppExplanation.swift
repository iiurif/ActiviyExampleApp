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
        NavigationStack{
            ZStack{
                Color.fundoDefault
                    .ignoresSafeArea()
                VStack{
                    Image("CatExplanation")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    AppButton(text: "Seguir") {
                        withAnimation {
                            screen = .one
                        }
                    }
                    .padding(.horizontal, 30)
                }//VStack
            }
            .toolbar{
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
   AppExplanation(screen: .constant(.zero))
}

#Preview {
    VStack(spacing: 0) {
        Circle()
            .frame(height: 100)
            .offset(y: 40)
            .zIndex(1)
        Text("sadjjklkllkjkllkjkljkljlkjlkjkljkljlkjlklkjlkjlkjlkjljlkjlkjlkjkljklljljlkjkllkjlkjkljlkjkljlkjlksaddasdasdadasdddad")
            .padding()
            .background(.red)
            .padding()
        Rectangle()
            .frame(width: 10)
    }
}
