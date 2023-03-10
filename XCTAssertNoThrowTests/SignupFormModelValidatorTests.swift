//
//  SignupFormModelValidatorTests.swift
//  XCTAssertNoThrowTests
//
//  Created by realxnesia on 25/01/23.
//

import XCTest
@testable import XCTAssertNoThrow

final class SignupFormModelValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func test_FirstNameValidation_WhenInvalidCharactersProvided_ThrowsAnError() {
        // Arrange
        let sut = SignupFormModelValidator()
        
        // ACT and Assert
        XCTAssertThrowsError(try sut.isFirstNameValid("Dhika*"), "this firstNameValid() shouldhave thrown an error if user's first name contains illegal character") { (errorThrown) in
            XCTAssertEqual(errorThrown as? SignupError, SignupError.illegalCharactersFound)
        }
    }
    
    func test_FirstNameValidation_WhenValidCharactesProvided_ThrowsNoErrors() {
        // Arrange
        let sut = SignupFormModelValidator()
        
        //Act and Assert
        XCTAssertNoThrow(try sut.isFirstNameValid("Dhika"), "The isFirstNamevalid() should not have thrown an error when there are no illegal characters provided")
    }
    
    //MARK: - Do Try Catch
    
    func test_FirstNameValidation_WhenInvalidCharactersProvided_ThrowsAnError_withDoTryCatch() {
        // Arrange
        let sut = SignupFormModelValidator()
        
        do {
            let _ = try sut.isFirstNameValid("Dhika*")
            //if fail is not thrown maka jalankan
            XCTFail("The isFirstNamevalid() was supposed to thrown an error when illegal characters used in user firstname")
        } catch SignupError.illegalCharactersFound {
            // Successfully passing
            return
        } catch {
            XCTFail("The isFirstNamevalid() was supposed to thrown an error with error *.illegalsCharacterNotFound")
        }
    }
    
    func test_FirstNameValidation_WhenValidCharactesProvided_ThrowsNoErrors_withDoTryCatch() {
        // Arrange
        let sut = SignupFormModelValidator()
        
        //Act and Assert
        do {
            let _ = try sut.isFirstNameValid("Dhika")
        } catch {
            XCTFail("The isFirstNamevalid() was supposed to thrown an error when a valid first name value was provided")
        }
    }
}
