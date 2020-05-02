import UIKit

class MessageView: InfoView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if let superview = self.superview {
            superview.backgroundColor = UIColor.backgroundInactive
            superview.subviews.forEach {
                if !$0.isKind(of: BackButton.self)  {
                    $0.isUserInteractionEnabled = false
                }
                if $0 == self {
                    $0.isUserInteractionEnabled = true
                }
            }
        }
    }
    
    
   
}
