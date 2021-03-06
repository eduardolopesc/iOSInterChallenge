import UIKit

extension Collection where Self.Element == NSLayoutConstraint {
    func activate() {
        forEach { $0.isActive = true}
    }
}
