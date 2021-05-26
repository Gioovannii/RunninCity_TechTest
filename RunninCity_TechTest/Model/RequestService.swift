//
//  RequestService.swift
//  RunninCity_TechTest
//
//  Created by Giovanni Gaffé on 2021/5/20.
//

import Foundation

final class RequestService {
    
    private let session: URLSession
    private var task: URLSessionDataTask?
    
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    func request(callback: @escaping (Result<LmStudioJSON, NetworkError>) -> Void) {
        guard let baseUrl = URL(string: "http://lmstudio.free.fr/lyon.json") else { return }
        task?.cancel()
        task = session.dataTask(with: baseUrl) { (data, response, error) in

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
            
            guard let responseJSON = try? JSONDecoder().decode(LmStudioJSON.self, from: data) else {
                callback(.failure(.undecodableData))
                return
            }
            callback(.success(responseJSON))
        }
        task.resume()
    }
}
