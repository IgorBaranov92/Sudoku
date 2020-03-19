import UIKit

class ErrorViewAnimation {

    static func show(_ view:UIView) {
        UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: Constants.durationForAppearingErrorView,
            delay: 0.0,
            options: .curveLinear,
            animations: { view.alpha = 1.0})
        { if $0 == .end {
            UIViewPropertyAnimator.runningPropertyAnimator(
                withDuration: Constants.durationForDisappearingErrorView,
                delay: 1.0,
                options: .curveLinear,
                animations: {
                    view.alpha = 0
            }) {  if $0 == .end { view.removeFromSuperview() }
            }
        }
        }
    }
    
}
