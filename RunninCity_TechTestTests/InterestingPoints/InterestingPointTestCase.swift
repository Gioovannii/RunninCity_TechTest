//
//  InterestingPointTestCase.swift
//  RunninCity_TechTestTests
//
//  Created by Giovanni Gaffé on 2021/5/26.
//

@testable import RunninCity_TechTest
import XCTest

final class InterestingPointsTestCase: XCTestCase {
    
    func testGetSubtitle_ShouldreturnName_IfInterestingPointIsFetch() {
        let point = InterestingPoints(name: "Paris", longitude: 0.0, latitude: 0.0)
        XCTAssertEqual(point.subtitle, "Paris")
        XCTAssertEqual(point.location.coordinate.longitude, 0.0)
        XCTAssertEqual(point.location.coordinate.latitude, 0.0)

    }
}
