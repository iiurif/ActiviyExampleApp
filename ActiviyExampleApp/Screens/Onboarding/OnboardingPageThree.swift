//
//  OnboardingPageThree.swift
//  ActiviyExampleApp
//
//  Created by User on 18/03/25.
//

import SwiftUI

struct OnboardingPageThree : View {
    
    @Binding var screen : ScreenState
    @State var username : String = ""
    @State var showButton : Bool = false
    
    var body : some View {
        NavigationStack{
            VStack {
                Image("onboard3")
                    .resizable()
                    .frame(width: 250,height: 385)
                    .scaledToFit()
                
                HStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(Color.white)
                        .frame(height: 55)
                        .overlay {
                            HStack {
                                TextField("", text: $username, prompt: Text("Digite aqui...").foregroundColor(.black).fontWeight(.bold))
                                    .foregroundStyle(.black)
                                    .padding(.leading,10)
                            }
                        }.padding()
                    
                    if self.username != "" {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            circleButton
                        }
                    }
                }
            }.onTapGesture {
                self.endTextEditing()
            }
            .toolbar{
                ToolbarItem(placement: .cancellationAction){
                    Button {
                        screen = .two
                    } label: {
                        Text("Voltar")
                    }

                }
            }
        }
    }
    
    private var circleButton : some View {
        
        Button {
            User.shared.setName(username)
            screen = .three
        } label: {
            Circle()
                .foregroundStyle(.white)
                .frame(width: 53, height: 53, alignment: .center)
                .padding(.trailing)
                .overlay {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                        .foregroundStyle(Color.brown)
                        .offset(x:-8)
                }
        }
    }
}

#Preview {
    OnboardingPageThree(screen: .constant(.three))
}
