import UIKit

class ErrorView: UIView {

    var message = "" { didSet { setNeedsDisplay() }}
    
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect,
                               cornerRadius: Constants.cornerRadiusForErrorView)
        UIColor.orange.setFill()
        path.fill()
        let label = UILabel(frame: rect)
        label.text = message
        label.textAlignment = .center
        addSubview(label)
        alpha = 0
        UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: Constants.durationForAppearingErrorView,
            delay: 0.0,
            options: .curveLinear,
            animations: { self.alpha = 1.0})
        { if $0 == .end {
            UIViewPropertyAnimator.runningPropertyAnimator(
                withDuration: Constants.durationForDisappearingErrorView,
                delay: 1.0,
                options: .curveLinear,
                animations: {
                    self.alpha = 0
            }) {  if $0 == .end { self.removeFromSuperview() }
            }
        }
        }
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .clear
    }
    
}
