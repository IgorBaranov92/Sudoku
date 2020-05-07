import UIKit

class InfoView: UIView {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: bounds,
                                cornerRadius: Constants.cornerRadiusForTutorialView)
        UIColor.background.setFill()
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
           layer.borderColor =  UIColor.dynamicBlack.cgColor
           layer.borderWidth = 2.0
        }

    
}
