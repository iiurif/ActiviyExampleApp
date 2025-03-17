//
//  TabBarView.swift
//  ActiviyExampleApp
//
//  Created by User on 17/03/25.
//

import SwiftUI

struct TabBarView : View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
             RandomActivityView()
                .tabItem {
                    Image(systemName: "lightbulb.max.fill")
                    Text("Sugestão Aleatoria")
                }
        }
    }
}
