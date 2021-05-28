//
//  NetworkError.swift
//  RunninCity_TechTest
//
//  Created by Giovanni Gaffé on 2021/5/20.
//

import Foundation

enum NetworkError: Error {
    case noData
    case incorrectResponse
    case undecodableData
    
    var description: String {
        switch self {
        case .noData:
            return "Il n'y a pas de données"
        case .incorrectResponse:
            return "En attente de réponse"
        case .undecodableData:
            return "Les donnée sont introuvable"
        }
    }
}
