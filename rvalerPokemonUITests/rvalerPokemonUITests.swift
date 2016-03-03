//
//  rvalerPokemonUITests.swift
//  rvalerPokemonUITests
//
//  Created by Rafael Valer on 2/29/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import XCTest

class rvalerPokemonUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoginSuccessful(){
        let app = XCUIApplication()
        let usernameTextField = app.textFields["username"]
        usernameTextField.tap()
        usernameTextField.typeText("ash")
        
        let passwordSecureTextField = app.secureTextFields["password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("mistyS2")
        app.buttons["Login"].tap()
    }
    
    func testLoginFailed(){
        let app = XCUIApplication()
        let usernameTextField = app.textFields["username"]
        usernameTextField.tap()
        usernameTextField.typeText("Layla")
        
        let passwordSecureTextField = app.secureTextFields["password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("mistyS2")
        app.buttons["Login"].tap()
    }
    
    func testPokemonData(){
        
        let app = XCUIApplication()
        let usernameTextField = app.textFields["username"]
        usernameTextField.tap()
        usernameTextField.typeText("vai")
        
        let passwordSecureTextField = app.secureTextFields["password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("ololo")
        app.buttons["Login"].tap()
        
        
//        
//        let app = XCUIApplication()
//        let usernameTextField = app.textFields["username"]
//        usernameTextField.tap()
//        usernameTextField.typeText("ash")
//        
//        let passwordTextField = app.textFields["password"]
//        passwordTextField.tap()
//        passwordTextField.typeText("mistyS2")
//        app.buttons["Login"].tap()
//        
//        // home view has 6 pokemons + 1 info about trainer
//        XCTAssert(app.tables.elementBoundByIndex(0).cells.count == 7)
    }
    
    func testPokemonSkillsContent(){
        let app = XCUIApplication()
        let usernameTextField = app.textFields["username"]
        usernameTextField.tap()
        usernameTextField.typeText("ash")
        
        let passwordSecureTextField = app.secureTextFields["password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("mistyS2")
        app.buttons["Login"].tap()
        
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Ash Ketchum"].swipeUp()
        tablesQuery.staticTexts["Primeape"].tap()
        
        // every pokemon has 4 skills
        XCTAssert(app.tables.elementBoundByIndex(0).cells.count == 4)
    }
    
    func testPokemonSkills(){
        
        let app = XCUIApplication()
        let usernameTextField = app.textFields["username"]
        usernameTextField.tap()
        usernameTextField.typeText("ash")
        
        let passwordSecureTextField = app.secureTextFields["password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("mistyS2")
        app.buttons["Login"].tap()
        
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Pikachu"].tap()
        
        let backButton = app.navigationBars["rvalerPokemon.PokemonDetailsView"].childrenMatchingType(.Button).matchingIdentifier("Back").elementBoundByIndex(0)
        backButton.tap()
   
        tablesQuery.staticTexts["Charizard"].tap()
        backButton.tap()
        
        
//        
//        tablesQuery.staticTexts["Bulbasaur"].tap()
//        backButton.tap()
//        
//        tablesQuery.staticTexts["Squartle"].tap()
//        backButton.tap()
//        // Failed to find matching element please file bug (bugreport.apple.com) and provide output from Console.app
//        tablesQuery.staticTexts["Primeape"].tap()
//        backButton.tap()
//        // Failed to find matching element please file bug (bugreport.apple.com) and provide output from Console.app
//        tablesQuery.staticTexts["Snorlax"].tap()
//        backButton.tap()
        

    }
}
