//
//  LmStudioTestCase.swift
//  RunninCity_TechTestTests
//
//  Created by Giovanni Gaffé on 2021/5/26.
//

@testable import RunninCity_TechTest
import XCTest

final class RequestServiceTestCase: XCTestCase {
    
    // MARK: - Get Interesting Points
    
    func testGetInterestingPoints_ShouldPostSuccess_IfNoError() {
        let service = RequestService(session: URLSessionFake(data: FakeResponseData.correctData, response: FakeResponseData.responseOK, error: nil))
        
        let expectation = XCTestExpectation(description: "Wait for queue change")
        
        service.request { (result: Result<LmStudioJSON, NetworkError>) in
            guard case .success(let data) = result else {
                XCTFail("testGetInterestingPoint_ShouldPostSuccess_IfNoError")
                return
            }
            
            XCTAssertEqual(data.city, "Lyon")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    // MARK: - Get Interesting Points Failed
    
    func testGetInterestingPoints_ShouldPostFailedCallback_IfIncorrectDataAndResponseKO() {
        let service = RequestService(session: URLSessionFake(data: FakeResponseData.incorrectData, response: FakeResponseData.responseKO, error: nil))

        let expectation = XCTestExpectation(description: "Wait for queue change")

        service.request { (result: Result<LmStudioJSON, NetworkError>) in

            guard case .failure(let error) = result else {
                XCTFail("error")
                return
            }

            XCTAssertNotNil(error)
            expectation.fulfill()
        }
    }
}
