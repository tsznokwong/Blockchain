//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import GameplayKit


let chain = BlockChain<String>(genesisBlock: Block<String>(data: "genesis", with: Date()))

print("mining Block 1")
chain.addNewBlock(Block<String>(data: "Block 1", with: Date()))

print("mining Block 2")
chain.addNewBlock(Block<String>(data: "Block 2", with: Date()))

print("mining Block 3")
chain.addNewBlock(Block<String>(data: "Block 3", with: Date()))


