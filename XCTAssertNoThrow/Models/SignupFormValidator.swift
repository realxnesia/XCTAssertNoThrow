//
//  SignupFormValidator.swift
//  XCTAssertNoThrow
//
//  Created by realxnesia on 25/01/23.
//

import Foundation

class SignupFormModelValidator {
    private let invalidCharacters = CharacterSet(charactersIn: "{}$#%+&*^,.,/?!@")
    func isFirstNameValid(_ firstName: String) throws -> Bool {
        var returnValue = true
        
        //TODO: Check illegal Character
        if (firstName.rangeOfCharacter(from: invalidCharacters) != nil) {
            throw SignupError.illegalCharactersFound
        }
        
        //TODO: Check first name
        if firstName.count < 2 || firstName.count > 10 {
            returnValue = false
        }
        
        return returnValue
    }
}
