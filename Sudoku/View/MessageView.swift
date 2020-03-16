import UIKit

class MessageView: UIView {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: bounds,
                                cornerRadius: Constants.cornerRadiusForTutorialView)
        UIColor.white.setFill()
        path.fill()
        if let superview = self.superview {
            superview.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            superview.subviews.forEach {
                if $0 != self  {
                    $0.isUserInteractionEnabled = false
                }
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        backgroundColor = .clear
        layer.cornerRadius = Constants.cornerRadiusForTutorialView
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2.0
        
     }
}
