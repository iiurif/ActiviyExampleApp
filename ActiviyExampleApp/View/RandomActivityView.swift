//
//  ActivitieView.swift
//  ActiviyExampleApp
//
//  Created by Iuri Ferreira on 17/03/25.
//

import SwiftUI

struct RandomActivityView: View {
    
    @StateObject var vm : RandomActivityViewViewModel = RandomActivityViewViewModel()
    
    var body: some View {
        if let activity = vm.randomActivity {
            VStack(alignment: .leading,spacing: 30) {
                Text("Olá bla bla bla.. que tal \(activity.title.lowercased())?")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Você sabia que \(activity.description.lowercased())")
                    .font(.body)
                
                AppButton(text: "Aceitar sugestão") {
                    print("Aceitar")
                }
                
                Button {
                    
                } label: {
                    Text("Cancelar")
                        .foregroundStyle(.red)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
//                        .frame(height: 55)
//                        .background(Color.brown)
//                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                }
            }
            .padding(.horizontal)
            .onAppear {
                vm.getRandomActivity()
            }
        }
    }
}

#Preview {
    RandomActivityView()
}
