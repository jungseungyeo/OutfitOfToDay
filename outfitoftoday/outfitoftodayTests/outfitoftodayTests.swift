//
//  outfitoftodayTests.swift
//  outfitoftodayTests
//
//  Created by Jung seoung Yeo on 2018. 7. 4..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import XCTest

class outfitoftodayTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func test_makeAnimationObject() {
        let animationObject = WeatherAnimationViewController()
        XCTAssertNotNil(animationObject)
    }
    
}
