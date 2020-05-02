import UIKit

class CellAnimator {

    class func animate(_ view:UIView) {
        UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: Constants.durationForFillingRegionAnimation,
            delay: 0.0,
            options: .curveLinear,
            animations: {
                view.backgroundColor = .selection
        }) {  if $0 == .end {
            UIViewPropertyAnimator.runningPropertyAnimator(
                withDuration: Constants.durationForFillingRegionAnimation,
                delay: 0.0,
                options: .curveLinear,
                animations: {
                    view.backgroundColor = .clear
            })
            }
            
        }
        
    }
    
}
