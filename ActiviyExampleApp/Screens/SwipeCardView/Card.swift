//
//  Card.swift
//  ActiviyExampleApp
//
//  Created by Iuri Ferreira on 22/03/25.
//

import SwiftUI

struct Card : View {
    
    let card : RandomActivity
    var onRemove: () -> Void
    
    @State private var offset: CGSize = .zero
    @State private var rotation: Double = 0
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .foregroundStyle(Color.init(red: 237 / 255, green: 210 / 255, blue: 184 / 255))
            .frame(height: UIScreen.main.bounds.size.height * 0.7)
            .padding()
            .overlay {
                VStack {
                    HStack {
                        Text(card.title)
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                    }.padding(.leading,25)
                    
                    Text(card.description)
                        .frame(height: 300)
                        .frame(width: 335)
                }
            }
            .shadow(radius: 1)
            .offset(x: offset.width, y: offset.height)
            .rotationEffect(.degrees(rotation))
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        offset = gesture.translation
                        rotation = Double(gesture.translation.width / 10) // Adds slight rotation
                    }
                    .onEnded { gesture in
                        if abs(gesture.translation.width) > 100 {
                            swipeCard()
                        } else {
                            resetCard()
                        }
                    }
            )
            .animation(.spring(), value: offset)
    }
    
    private func swipeCard() {
        let direction: CGFloat = offset.width > 0 ? 1 : -1
        offset.width = direction * 500 // Move card off-screen
        rotation = direction * 25
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            onRemove()
        }
    }
    
    private func resetCard() {
        offset = .zero
        rotation = 0
    }
}

#Preview {
    Card(card: RandomActivity(category: "Lúdico", title: "Passear", benefits: [""], description: "Passer passear passear passear passear passear passear passear passear passear passear passear passear")) {
        
    }
}
