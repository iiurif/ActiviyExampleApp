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
            ZStack{
                Color.fundoDefault
                    .ignoresSafeArea()
                VStack(spacing: 30) {
                    Image("CatAsksName")
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(Color.white)
                        .frame(height: 55)
                        .overlay {
                            HStack {
                                TextField("", text: $username, prompt: Text("Digite aqui...").foregroundColor(.black))
                                    .foregroundStyle(.black)
                                    .padding(.leading, 10)
                            } //HStack
                        }
                    if self.username == "" {
                        AppButton(text: "Seguir", action: {
                            
                        }, isDescructive: false, disable: true)
                    } else {
                        AppButton(text: "Seguir") {
                            withAnimation {
                                screen = .three
                            }
                        }
                    }
                
                }//VStack
                .padding(.horizontal, 30)
                .onTapGesture {
                    self.endTextEditing()
                }
                .toolbar{
                    ToolbarItem(placement: .cancellationAction)
                    {
                        Button {
                            withAnimation {
                                screen = .one
                            }
                        } label: {
                            Image(systemName:"chevron.compact.backward")
                            Text("Voltar")
                                .font(.system(size: 22))
                        }

                    }
                }
            } //VStack
            } // ZStack
        } // NavigationStack
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
