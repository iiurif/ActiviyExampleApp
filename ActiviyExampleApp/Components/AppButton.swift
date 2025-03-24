//
//  AppButton.swift
//  ActiviyExampleApp
//
//  Created by User on 17/03/25.
//

import SwiftUI

struct AppButton : View {
    
    let text: String
    var isDescructive : Bool = false
    var disable : Bool = false
    let action : () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(isDescructive ? Color.red : Color.brown)
                .background(self.disable ? Color.gray : Color.brown)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}
