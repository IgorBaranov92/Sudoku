import UIKit

class NoButton: UIButton {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: Constants.cornerRadiusForDoneButton)
        UIColor.dynamicBlue.setFill()
        path.fill()
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont(name: "Avenir Next", size: 25.0)
        setTitle("Нет", for: .normal)
    }

}
