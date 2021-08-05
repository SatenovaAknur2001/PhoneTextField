//
//  StringExtension.swift
//  PhoneTextField
//
//  Created by Акнур on 02.08.2021.
//


import Foundation
import SwiftUI

extension String {
    
    func hasUppercasedCharacters() -> Bool {
        return stringFulfillsRegex(regex:  ".*[A-Z]+.*")
    }
    
    func hasSpecialCharacters() -> Bool {
        return stringFulfillsRegex(regex: ".*[^A-Za-z0-9].*")
    }
    
    private func stringFulfillsRegex(regex: String) -> Bool {
        let texttest = NSPredicate(format: "SELF MATCHES %@", regex)
        guard texttest.evaluate(with: self) else {
            return false
        }
        return true
    }

    func isPasswordHasEightCharacter() -> Bool {
        let passWordRegEx = "^.{2,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passWordRegEx)
        return passwordTest.evaluate(with: self)
    }
    
    func isPasswordHasDigit() -> Bool {
        let passWordRegEx = "(?s)[^0-9]*[0-9].*"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passWordRegEx)
        return passwordTest.evaluate(with: self)
    }
    
    func isPasswordHasLowerCharacter() -> Bool {
        let passWordRegEx = "(?s)[^a-z]*[a-z].*"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passWordRegEx)
        return passwordTest.evaluate(with: self)
    }
    
    func isPasswordHasUpperCharacter() -> Bool {
        let passWordRegEx = "(?s)[^A-Z]*[A-Z].*"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passWordRegEx)
        return passwordTest.evaluate(with: self)
    }
    
    func isValid() -> Bool {
        if self.isPasswordHasDigit(),
            self.isPasswordHasLowerCharacter(),
            self.isPasswordHasUpperCharacter(),
            self.isPasswordHasEightCharacter() {
            return true
        }
        return false
    }
    
    func isEqual(_ repeatedPassword: String) -> Bool {
       return (!repeatedPassword.isEmpty && self != repeatedPassword)
    }
    
    func convertToDictionary() -> [String: Any]? {
            if let data = data(using: .utf8) {
                return try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            }
            return nil
        }
}
