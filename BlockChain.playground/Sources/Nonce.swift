import Foundation


public class Nonce: CustomStringConvertible {
    
    private class Digit {
        private static let digits: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
        private init() {}
        static func getRandom() -> Character {
            return digits.randomElement()!
        }
    }
    
    private var data: String
    private let length: UInt
    
    public init(length: UInt = 64) {
        self.length = length
        self.data = ""
        self.regenerate()
    }
    
    public func regenerate() {
        self.data = String((1 ... self.length).map { (_) -> Character in
            return Digit.getRandom()
        })
    }
    
    public var description: String {
        return self.data
    }
}

