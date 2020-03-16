import UIKit

class ErrorView: UIView {

    var message = " " { didSet { setNeedsDisplay() }}
    
    
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
        ErrorViewAnimation.show(self)
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
