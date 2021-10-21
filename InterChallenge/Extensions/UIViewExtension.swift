import UIKit

extension UIView {
    
    func addSubViews(_ views: [UIView], translatesAutoresizingMaskIntoConstraints: Bool = false) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
            addSubview($0)
        }
    }
    
}
