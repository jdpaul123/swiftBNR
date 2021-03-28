//
//  Logged.swift
//  MonsterTown
//
//  Created by Jonathan Paul on 3/28/21.
//
// THIS WHOLE FILE IS FOR CHAPTER 26 Bronze Challenge

import Foundation

@propertyWrapper public struct Logged {
    private var storage: Int
    private var warningValue: Int
    
    public init(wrappedValue: Int, warningValue: Int) {
        storage = wrappedValue
        self.warningValue = warningValue
    }
    
    public var wrappedValue: Int {
        set {
            if storage <= warningValue {
                print("The new value is \(newValue) and the old one is \(storage)")
                print("Warning: the value is below a safe level")
            } else {
                print("The new value is \(newValue) and the old one is \(storage)")
            }
            storage = newValue

        }
        get {
            return storage
        }
    }
}
