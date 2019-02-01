import Foundation
import GameplayKit

public class Block<Element: Hashable>: CustomStringConvertible {
    public var index: Int = 0
    public var timestamp: Date
    public var data: Element
    public var previousHash: UInt = 0
    public var hash: UInt
    public var nonce: Nonce = Nonce(length: 64)
    
    public init(data: Element) {
        self.data = data
        self.timestamp = Date()
        self.hash = UInt(bitPattern: "\(self.index)\(self.timestamp)\(self.previousHash)\(self.data)\(self.nonce)".hashValue)
    }
    
    public func calculateHash() -> UInt {
        return UInt(bitPattern: "\(self.index)\(self.timestamp)\(self.previousHash)\(self.data)\(self.nonce)".hashValue)
    }
    
    public func mineBlock(difficulty: UInt) {
        while !self.hash.toString().hasPrefix(String(repeating: "0", count: Int(difficulty))) {
            self.nonce.regenerate()
            self.hash = self.calculateHash()
        }
        print("Block mined: \(self)")
    }
    
    public var description: String {
        return """
        {
        \(self.index), \(self.timestamp)
        \(self.data)
        previousHash: \(self.previousHash.toString())
        hash        : \(self.hash.toString())
        }
        
        """
    }
}
