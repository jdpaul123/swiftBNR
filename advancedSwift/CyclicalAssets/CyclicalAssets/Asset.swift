//
//  Asset.swift
//  CyclicalAssets
//
//  Created by Jonathan Paul on 3/27/21.
//

import Foundation

class Asset {
    let name: String
    var value: Double {
        didSet {
            changeHandler(value - oldValue)
        }
    }
    weak var container: Vault? // weak turns the strong ref into a weak one, meaning that the ref does not incriment the ref count.
    // Weak must be used on optionals with var and not let for the initialization of the variable as weak refs are tied to nil
    
    typealias ValueChangeHandler = (Double) -> Void
    var changeHandler: ValueChangeHandler
    
    init(name: String, value: Double, changeHandler: @escaping ValueChangeHandler = {_ in}) {
        self.name = name
        self.value = value
        self.changeHandler = changeHandler
    }
    
    deinit {
        print("\(self) is being deallocated")
    }
}

extension Asset: CustomStringConvertible {
    var description: String {
        if let container = container {
            return "Asset(\(name), worth \(value), in \(container))"
        } else {
            return "Asset(\(name), worth \(value), not stored anywhere)"
        }
    }
}
