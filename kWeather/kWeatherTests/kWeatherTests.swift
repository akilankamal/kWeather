//
//  kWeatherTests.swift
//  kWeatherTests
//
//  Created by Akilan on 02/11/20.
//  Copyright © 2020 aki. All rights reserved.
//

import XCTest
@testable import kWeather

class kWeatherTests: XCTestCase {

    var mockWeatherService: MockWeatherService!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        mockWeatherService = MockWeatherService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        mockWeatherService = nil
    }

    func testMockWeatherServiceForValidCoordinates() throws {
        mockWeatherService.getWeatherForecast(for: "59.337239", longitude: "18.062381") { [weak self] (forecast, error) in
            guard let weakSelf = self, let actualLatitude = forecast?.latitude, let actualLongitude = forecast?.longitude else {
                XCTFail()
                return
            }
            
            let expectedLatitude = "59.337239"
            let expectedLongitude = "18.062381"
            
            XCTAssertTrue(expectedLatitude == String(actualLatitude))
            XCTAssertTrue(expectedLongitude == String(actualLongitude))
        }
    }
}
