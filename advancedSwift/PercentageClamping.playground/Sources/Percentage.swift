import Foundation

@propertyWrapper public struct Percentage {
    private var storage: Double
    private var upperBound: Double
    
    public init(wrappedValue: Double, upperBound: Double = 1) {
//        storage = max(min(wrappedValue, 1), 0)
        storage = wrappedValue
        self.upperBound = upperBound
    }
    
    public var wrappedValue: Double {
        set {
//            storage = max(min(newValue, upperBound), 0)
            storage = newValue
        }
        get {
//            return storage
            return max(min(storage, upperBound), 0)
        }
    }
    
    public var projectedValue: Double {
        get {
            return storage
        }
    }
}
