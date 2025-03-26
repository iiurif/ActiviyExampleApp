//
//  User.swift
//  ActiviyExampleApp
//
//  Created by Iuri Ferreira on 18/03/25.
//

import Foundation

@Observable
class User {
    
    var name : String = ""
    var activities : [Activity] = []
    var firstAcess: Bool = false
    
    static let shared = User()
    
    func setName(_ name: String) {
        self.name = name
    }
}
