import UIKit

class ConstaintAnimator {
    
    class func animate(_ constaint:NSLayoutConstraint,height:CGFloat) {
        UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: Constants.durationForChangingConstraint,
            delay: 0.0,
            options: .curveLinear,
            animations: {
                constaint.constant = height
        }) { if $0 == .end  {}
        }
    }
    
}
