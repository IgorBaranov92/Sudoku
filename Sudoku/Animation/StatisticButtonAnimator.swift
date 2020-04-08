import UIKit


class StatisticButtonAnimator {
    
    static func animate(_ view:UIButton) {
        UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: Constants.durationForScalingStatisticButton,
            delay: 0.0,
            options: .curveLinear,
            animations: {
                view.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) {  if $0 == .end {
            UIViewPropertyAnimator.runningPropertyAnimator(
                withDuration: Constants.durationForScalingStatisticButton,
                delay: 0.0,
                options: .curveLinear,
                animations: {
                    view.transform = .identity
            })
            }
            
        }
    }
}
