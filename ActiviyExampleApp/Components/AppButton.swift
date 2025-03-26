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
                .foregroundStyle(.accent)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(self.disable ? Color.gray : (self.isDescructive ? Color.red : Color.button))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(radius: self.disable ? 0 : 2, x: self.disable ? 0 : 2, y: self.disable ? 0 : 2)
        }
    }
}
