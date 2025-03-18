//
//  OnboardPage2.swift
//  ActiviyExampleApp
//
//  Created by User on 18/03/25.
//

import SwiftUI

struct OnboardPageTwo: View {
    
    @Binding var procced : Bool
    
    var body: some View {
        ZStack {
            VStack {
                Image("catboard1")
                    .resizable()
                    .frame(width: 250,height: 350)
                    .scaledToFit()
                
                AppButton(text: "Seguir") {
                    withAnimation {
                        procced.toggle()
                    }
                }
                .padding(.horizontal,20)
            }
        }
    }
}

#Preview {
    //OnboardPageTwo()
}
