import UIKit

class InfoView: UIView {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: bounds,
                                cornerRadius: Constants.cornerRadiusForTutorialView)
        (UIColor(named: "DynamicColorForMessageView") ?? .white).setFill()
        path.fill()
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
           layer.borderColor = UIColor(named:"DynamicBorderMessageViewColor")?.cgColor ?? UIColor.black.cgColor
           layer.borderWidth = 2.0
        }
       
       override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
           setup()
       }
    
    
}
