import Foundation

public class BlockChain<Element: Hashable>: CustomStringConvertible {
    public private(set) var chain: [Block<Element>]
    private let difficulty = 7
    
    public init(genesisBlock: Block<Element>) {
        self.chain = [genesisBlock]
    }
    
    public func latestBlock() -> Block<Element>? {
        return self.chain.last
    }
    
    public func addNewBlock(_ newBlock: Block<Element>) {
        newBlock.previousHash = self.latestBlock()?.hash ?? 0
        newBlock.index = (self.latestBlock()?.index ?? 0) + 1
        newBlock.mineBlock(difficulty: self.difficulty)
        self.chain.append(newBlock)
    }
    
    public func isValid() -> Bool {
        for index in 1 ..< self.chain.count {
            if self.chain[index - 1].hash != self.chain[index].previousHash {
                return false
            }
            
            if self.chain[index].hash != self.chain[index].calculateHash() {
                return false
            }
        }
        return true
    }
    
    public var description: String {
        return self.chain.map({ $0.description }).joined(separator: " -> ")
    }
    
}
