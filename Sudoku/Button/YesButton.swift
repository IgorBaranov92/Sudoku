import UIKit

class YesButton: UIButton {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: Constants.cornerRadiusForDoneButton)
        #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1).setFill()
        path.fill()
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont(name: "Avenir Next", size: 25.0)
        setTitle(localized("yes"), for: .normal)
    }

}
