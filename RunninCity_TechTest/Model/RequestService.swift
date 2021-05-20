//
//  RequestService.swift
//  RunninCity_TechTest
//
//  Created by Giovanni Gaffé on 2021/5/20.
//

import Foundation

final class RequestService {
    
    func request(callback: @escaping (Result<LmStudioJSON, NetworkError>) -> Void) {
        guard let baseUrl = URL(string: "http://lmstudio.free.fr/lyon.json") else { return }
        let task = URLSession.shared.dataTask(with: baseUrl) { (data, response, error) in
          
            callback(.success(responseJSON))
        }
        task.resume()
    }
}
