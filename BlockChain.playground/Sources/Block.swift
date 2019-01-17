import Foundation
import GameplayKit

public class Block<Element: Hashable>: CustomStringConvertible {
    public var index: Int = 0
    public var timestamp: Date
    public var data: Element
    public var previousHash: UInt = 0
    public var hash: UInt
    public var nonce = 0
    
    public init(data: Element, with timestamp: Date) {
        self.data = data
        self.timestamp = timestamp
        self.hash = UInt(bitPattern: abs("\(self.index)\(self.timestamp)\(self.previousHash)\(self.data)\(self.nonce)".hashValue))
    }
    
    public func calculateHash() -> UInt {
        return UInt(bitPattern: abs("\(self.index)\(self.timestamp)\(self.previousHash)\(self.data)\(self.nonce)".hashValue))
    }
    
    public func mineBlock(difficulty: Int) {
        let randomSource = GKRandomSource.sharedRandom()
        while !self.hash.toString().hasPrefix(String(repeating: "0", count: difficulty)) {
            self.nonce = randomSource.nextInt()
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
