//
//  SampleTest.swift
//  SwiftlintDangerSampleTests
//
//  Created by Didik on 23/10/21.
//

import XCTest

class SampleTest: XCTestCase {
  
  let numberOne = 1
  let numberTwo = 1
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testExample() throws {
    XCTAssertEqual(numberOne, numberTwo)
  }
}
