//
//  APITests.swift
//  marsPics
//
//  Created by Brian D Keane on 9/11/17.
//  Copyright © 2017 Brian D Keane. All rights reserved.
//

import XCTest
@testable import marsPics

class APITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let waitFor = expectation(description: "Nasa API Call")
        
        let api = NasaAPI()
        api.getPhotos(date: Date(timeIntervalSinceNow: -604800))
        .then
        {
            (photoInfos) -> Void in
            for info in photoInfos
            {
                print(info.urlString)
            }
    
            waitFor.fulfill()
        }
        .catch
        {
            (error) -> Void in
            print(error)
            waitFor.fulfill()
        }
        waitForExpectations(timeout: 10) { (error) in
            print(error)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
