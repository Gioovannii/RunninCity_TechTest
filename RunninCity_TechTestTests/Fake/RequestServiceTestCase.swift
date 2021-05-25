//
//  NetworkTestCase.swift
//  RunninCity_TechTestTests
//
//  Created by Giovanni Gaffé on 2021/5/25.
//

@testable import RunninCity_TechTest
import XCTest

class RequestServiceTestCase: XCTestCase {
    
    // MARK: - Error
    
    func testGetData_ShouldPostFailedCallbackError() {
        let session = RequestService(session: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error))
        
        let expectation = XCTestExpectation(description: "Wait for expectation")
        
        session.request { result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
        
    }

}
