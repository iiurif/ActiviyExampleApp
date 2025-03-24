//
//  Category.swift
//  ActiviyExampleApp
//
//  Created by User on 24/03/25.
//


//
//  Constants.swift
//  ActiviyExampleApp
//
//  Created by Iuri Ferreira on 24/03/25.
//

enum Category: String, CaseIterable, Identifiable {
    case ludico, esportivos, criativos, outros
    var id: Self { self }
    
    var description : String {
        switch self {
        case .ludico:
            return "Lúdicas"
        case .esportivos:
            return "Esportivas"
        case .criativos:
            return "Criativas"
        case .outros:
            return "Outras"
        }
    }
    
    var emptyDescription : String {
        switch self {
        case .ludico:
            return "Você não registrou atividades de diversão e relaxamento."
        case .esportivos:
            return "Você ainda não registrou atividades de saúde e bem-estar."
        case .criativos:
            return "Você ainda não registrou atividades de expressão artistica e aprendizado."
        case .outros:
            return "Outras"
        }
    }
}

enum Done: String, CaseIterable, Identifiable {
    case yes, no
    var id: Self { self }
    
    var description : String {
        switch self {
        case .yes:
            return "SIM"
        case .no:
            return "NÃO"
        }
    }
}
