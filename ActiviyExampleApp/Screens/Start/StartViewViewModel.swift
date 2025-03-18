//
//  StartViewViewModel.swift
//  ActiviyExampleApp
//
//  Created by Iuri Ferreira on 18/03/25.
//

import SwiftUI

class StartViewViewModel : ObservableObject {
    
    @Published var username : String = ""
    @Published var nextScreen : Bool = false
    
    func setUsername(_ name:String) {
        User.shared.setName(name)
        nextScreen.toggle()
    }
}
