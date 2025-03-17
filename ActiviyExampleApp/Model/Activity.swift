//
//  Activity.swift
//  ActiviyExampleApp
//
//  Created by Iuri Ferreira on 17/03/25.
//

struct Activity : Identifiable,Codable {
    var id : String {
        return self.title
    }
    let title : String
    let benefits : [String]
    let description : String
}
