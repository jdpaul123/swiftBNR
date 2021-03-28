//
//  Vault.swift
//  CyclicalAssets
//
//  Created by Jonathan Paul on 3/27/21.
//

import Foundation

class Vault {
    let number: Int
    
    private(set) var assets = [Asset]()
    
    var totalValue: Double = 0
    #warning("Implement totalValue as a computed property")
    
    init(number: Int) {
        self.number = number
    }
    
    deinit {
        print("\(self) is being deallocated")
    }
    
    func store(_ asset: Asset) {
        asset.container = self
        // the changeHandler below establishes a new strong reference from the Asset to Vault resulting in a new reference cycle
        // and hence, a leak. The forced use of self in self.totalValue acts as a warning that you are ceraing a new strong ref.
        asset.changeHandler = { [weak self] (change) in
            print("An asset has changed value by \(change). New total value: \(String(describing: self?.totalValue))")
        }
        assets.append(asset)
    }
    
// Bronze challenge Chapter 24
//    func remove(_ asset: Asset) {
//        asset.container = nil
//        if let index = assets.firstIndex {
//            assets.remove(at: index)
//        }
//    }

}

extension Vault: CustomStringConvertible {
    var description: String {
        return "Vault(\(number))"
    }
}
