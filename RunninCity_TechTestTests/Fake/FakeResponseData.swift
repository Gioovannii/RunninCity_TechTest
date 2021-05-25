//
//  RunninCity_TechTestTests.swift
//  RunninCity_TechTestTests
//
//  Created by Giovanni Gaffé on 2021/5/25.
//

@testable import RunninCity_TechTest
import XCTest

class FakeResponseData: XCTestCase {
    
    // MARK: - Data
    
    static var correctData: Data? {
        let Bundle = Bundle(for: FakeResponseData.self)
        let url = Bundle.url(forResource: "LmStudio", withExtension: ".json")!
        return try! Data(contentsOf: url)
    }
    
    static let incorrectData = "erreur".data(using: .utf8)
    
    // MARK: - Response
    
    static let responseOK = HTTPURLResponse(url: URL(string: "https://www.apple.com")!,statusCode: 200, httpVersion: nil,
        headerFields: nil)
    
    static let responseKO = HTTPURLResponse(url: URL(string: "https://www.apple.com")!, statusCode: 500, httpVersion: nil, headerFields: nil)
    
    
    
    final class GenericError: Error {}
    static let error = GenericError()
    
}

