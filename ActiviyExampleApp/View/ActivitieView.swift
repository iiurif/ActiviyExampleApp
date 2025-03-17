//
//  ActivitieView.swift
//  ActiviyExampleApp
//
//  Created by Iuri Ferreira on 17/03/25.
//

import SwiftUI

struct ActivityView: View {
    
    @StateObject var vm : ActivityViewViewModel = ActivityViewViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ActivityView()
}
