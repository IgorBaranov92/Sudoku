import UIKit

class MessageView: InfoView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if let superview = self.superview {
            superview.backgroundColor = .backgroundInactive
//            superview.isUserInteractionEnabled = false
        }
    }
}
