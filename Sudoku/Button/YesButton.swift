import UIKit

class YesButton: UIButton {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: Constants.cornerRadiusForDoneButton)
        UIColor.dynamicRed.setFill()
        path.fill()
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont(name: "Avenir Next", size: 25.0)
        setTitle("Да", for: .normal)
    }

}
