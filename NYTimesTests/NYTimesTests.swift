//
//  NYTimesTests.swift
//  NYTimesTests
//
//  Created by Fouad Bakour on 11/21/20.
//

import XCTest
@testable import NYTimes

class NYTimesTests: XCTestCase {

    func testHomePageServices() {
                
        // Given
        let promise = expectation(description: "Completion handler invoked")
        var errorMessage: String?
        var data: [ResultModel]?
        
        // When
        Services.getNews(section: .all, period: .oneDay) { (error, array) in
            errorMessage = error
            data = array
            promise.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 60, handler: nil)
        XCTAssertNil(errorMessage) //We want the response error to be nil, else, the test should fail
        XCTAssertGreaterThan(data?.count ?? 0, 0)
    }
    

}
