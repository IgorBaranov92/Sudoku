import UIKit

class MessageView: InfoView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if let superview = self.superview {
            superview.backgroundColor = UIColor(named: "DynamicBackgroundSuperviewColor") ?? #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
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
