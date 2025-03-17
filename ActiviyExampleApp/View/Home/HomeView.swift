//
//  HomeView.swift
//  ActiviyExampleApp
//
//  Created by User on 17/03/25.
//

import SwiftUI

struct HomeView : View {
    
    @State var addActivityView : Bool = false
    @State var activities : [Activity] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Adicionar atividade")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Button {
                        addActivityView.toggle()
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            
                    }
                }.padding(.top,20)
                
                Text("Atividades realizadas")
                    .frame(maxWidth: .infinity)
                
                ScrollView {
                    ForEach(activities) { _ in
                        RoundedRectangle(cornerRadius: 12)
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .padding()
                    }
                }
                
                Spacer()
            }
        }.sheet(isPresented: $addActivityView) {
            AddActivityView(activities: $activities)
        }
    }
}

#Preview {
    HomeView()
}
