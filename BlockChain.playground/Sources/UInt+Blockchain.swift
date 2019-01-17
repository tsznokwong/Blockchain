import Foundation
import UIKit

extension UInt {
    
    public func toString() -> String {
        return String(format: "%019lld", self)
    }
    
}
