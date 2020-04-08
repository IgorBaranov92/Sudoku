import UIKit

class CellAnimator {

    class func animate(_ button:UIButton) {
        
        UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: 2.0,
            delay: 0.0,
            options: .curveLinear,
            animations: {
                button.backgroundColor = .red
        }) {  if $0 == .end {
            UIViewPropertyAnimator.runningPropertyAnimator(
                withDuration: 2.0,
                delay: 0.0,
                options: .curveLinear,
                animations: {
                    button.backgroundColor = .clear
            })
            }
            
        }
        
    }
    
}
