import Foundation
import GameplayKit

public class Block<Element: Hashable>: CustomStringConvertible {
    public var index: Int = 0
    public var timestamp: Date
    public var data: Element
    public var previousHash: String = ""
    public var hash: String = ""
    public var nonce: Nonce = Nonce(length: 64)
    
    public init(data: Element) {
        self.data = data
        self.timestamp = Date()
        self.hash = self.calculateHash()
    }
    
    public func calculateHash() -> String {
        return "\(self.index)\(self.timestamp)\(self.previousHash)\(self.data)\(self.nonce)".sha256
    }
    
    public func mineBlock(difficulty: UInt) {
        while !self.hash.hasPrefix(String(repeating: "0", count: Int(difficulty))) {
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
        previousHash: \(self.previousHash)
        hash        : \(self.hash)
        }
        
        """
    }
}
