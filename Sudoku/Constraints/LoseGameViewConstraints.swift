import UIKit


class LoseGaveViewConstraints {
    
    class func activate(_ v1:UIView,_ v2:UIView) {
        v1.translatesAutoresizingMaskIntoConstraints = false
        v1.centerXAnchor.constraint(equalTo: v2.centerXAnchor).isActive = true
        v1.centerYAnchor.constraint(equalTo: v2.centerYAnchor).isActive = true
        v1.widthAnchor.constraint(equalToConstant: v2.bounds.width - 50).isActive = true
        v1.heightAnchor.constraint(equalToConstant: v2.bounds.width - 50).isActive = true
    }
    
    
}
