//
//  StartView.swift
//  ActiviyExampleApp
//
//  Created by Iuri Ferreira on 18/03/25.
//

import SwiftUI

struct StartView: View {
    
    @StateObject var vm : StartViewViewModel = StartViewViewModel()
    
    var body: some View {
        VStack {
            Text("Olá, como você se chama ?")
                .font(.title)
                .fontWeight(.bold)
            TextField("Digite aqui...", text: $vm.username)
                .padding(.horizontal)
            
            AppButton(text: "Continuar") {
                vm.setUsername(vm.username)
            }.padding()
            
            Button {
                
            } label: {
                Text("Pular")
                    .foregroundStyle(.red)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
            }
        }.fullScreenCover(isPresented: $vm.nextScreen) {
            TabBarView()
        }
    }
}

#Preview {
    StartView()
}
