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
    
    private init() {}
    
    static let shared = User()
    
    func setName(_ name: String) {
        self.name = name
    }
}
