//
//  AddActivityView.swift
//  ActiviyExampleApp
//
//  Created by User on 17/03/25.
//

import SwiftUI

struct AddActivityView : View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var activities : [Activity]
    
    var body: some View {
        VStack {
            Button("Adicionar") {
                activities.append(Activity(category: "", title: "", benefits: [""], description: ""))
                dismiss()
            }
        }
    }
}
