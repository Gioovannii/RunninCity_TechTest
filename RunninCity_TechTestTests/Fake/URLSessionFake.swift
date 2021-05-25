//
//  URLSessionFake.swift
//  RunninCity_TechTestTests
//
//  Created by Giovanni Gaffé on 2021/5/25.
//

import Foundation

final class URLSessionFake: URLSession {
    
    // MARK: - Properties
    
    private var data: Data?
    private var response: URLResponse?
    private var error: Error?
    
    init(data: Data?, response: URLResponse?, error: Error?) {
        self.data = data
        self.response = response
        self.error = error
    }
    
 
