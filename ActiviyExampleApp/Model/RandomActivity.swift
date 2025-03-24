//
//  RandomActivityResponse.swift
//  ActiviyExampleApp
//
//  Created by User on 24/03/25.
//


struct RandomActivityResponse : Codable {
    let activities : [RandomActivity]
}

struct RandomActivity : Identifiable, Codable {
    var id : String {
        return self.title
    }
    let category : String
    let title : String
    let benefits : [String]
    let description : String
}
