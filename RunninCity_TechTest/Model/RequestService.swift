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
            guard let data = data, error == nil else {
                print (error?.localizedDescription ?? "Response Error")
                callback(.failure(.noData))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                callback(.failure(.incorrectResponse))
                return
            }
            
           
            callback(.success(responseJSON))
        }
        task.resume()
    }
}
