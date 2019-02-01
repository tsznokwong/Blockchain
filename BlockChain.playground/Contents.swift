//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import GameplayKit


let chain = BlockChain<String>(genesisBlock: Block<String>(data: "genesis"), difficulty: 3)

let dataBlock = (1 ... 10).map({ "Block \($0)" })
dataBlock.forEach({ chain.addNewBlock(Block<String>(data: $0)); print(Date()) })

