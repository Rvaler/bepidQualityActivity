//
//  rvalerPokemonTests.swift
//  rvalerPokemonTests
//
//  Created by Rafael Valer on 2/29/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import XCTest
import Alamofire
import SwiftyJSON
@testable import rvalerPokemon

class rvalerPokemonTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoginTrue(){
        let expect = expectationWithDescription("Login")
        
        AccountManager.sharedInstace.login("ash", password: "mistyS2") { (result) -> Void in
            if result {
                XCTAssert(result == true, "Login efetuated")
            }
            expect.fulfill()
        }
        
        waitForExpectationsWithTimeout(10.0) { (error: NSError?) -> Void in
            print(error)
        }
    }
    
    func testLoginFalse(){
        let expect = expectationWithDescription("Login")
        
        AccountManager.sharedInstace.login("err", password: "mistyS2") { (result) -> Void in
            if result {
                XCTAssert(result == false, "Login not efetuated")
            }
            expect.fulfill()
        }
        
        waitForExpectationsWithTimeout(10.0) { (error: NSError?) -> Void in
            print(error)
        }
    }
    
    func testLoginFailed() {
        let exp = expectationWithDescription("waitLogin")
        Alamofire.request(.GET, "http://server03.local:60080/login?user=uuu&password=666", parameters: nil, encoding: .URL).responseJSON { (result) -> Void in
            
            if let jsonData = result.data {
                let json = JSON(data: jsonData)
                XCTAssert(json["response"] == "false")
                if json["response"] == "true" {
                    print("Login Done")
                } else {
                    print("Bad login")
                }
            }
            exp.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (err) -> Void in
            print("Timeout error")
        }
    }
    
    func testLoginSuccessful(){
        let exp = expectationWithDescription("waitLogin")
        Alamofire.request(.GET, "http://server03.local:60080/login?user=ash&password=mistyS2", parameters: nil, encoding: .URL).responseJSON { (result) -> Void in
            
            if let jsonData = result.data {
                let json = JSON(data: jsonData)
                XCTAssert(json["response"] == "true")
                if json["response"] == "true" {
                    print("Login Done")
                } else {
                    print("Bad login")
                }
            }
            exp.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (err) -> Void in
            print("Timeout error")
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
}
