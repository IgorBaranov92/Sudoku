import UIKit

class TutorialViewAnimator: UIViewPropertyAnimator {

    static func show(_ view:UIView) {
        view.alpha = 0
        view.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: Constants.durationForAppearingTutorialView,
            delay: 0.0,
            options: .curveLinear,
            animations: {
                view.transform = CGAffineTransform.identity
                view.alpha = 1.0
        })
    }
    
    static func dismiss(_ view:UIView) {
        UIViewPropertyAnimator.runningPropertyAnimator(
                   withDuration: Constants.durationForDisapperaingTutorialView,
                   delay: 0.0,
                   options: .curveLinear,
                   animations: {
                       view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                       view.alpha = 0.0
               }) {  if $0 == .end {
                   view.removeFromSuperview()
                   }
               }
    }
    
    
}
