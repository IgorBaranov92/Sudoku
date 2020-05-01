import UIKit

class CellAnimator {

    class func animate(_ view:UIView) {
        UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: Constants.durationForFillingRegionAnimation,
            delay: 0.0,
            options: .curveLinear,
            animations: {
                view.backgroundColor = #colorLiteral(red: 0.4670000076, green: 0.7649999857, blue: 0.2669999897, alpha: 1)
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
