//
//  SwipeCardExampleTwo.swift
//  ActiviyExampleApp
//
//  Created by Iuri Ferreira on 22/03/25.
//

import SwiftUI

struct SwipeCardView: View {
    
    @StateObject var vm : RandomActivityViewViewModel = RandomActivityViewViewModel()
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            ZStack {
                ForEach(vm.activityList) { activity in
                    Card(card: activity, onRemove: {
                        withAnimation {
                            removeCard(activity)
                        }
                    })
                }
            }
        }
    }
    
    private func removeCard(_ card: Activity) {
        vm.activityList.removeAll { $0.id == card.id }
    }
}

#Preview {
    SwipeCardView()
}
