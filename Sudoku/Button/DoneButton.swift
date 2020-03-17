import UIKit

class DoneButton: UIButton {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect,
                                cornerRadius: Constants.cornerRadiusForDoneButton)
        #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).setFill()
        path.fill()
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont(name: "Avenir Next", size: 20.0)
        setTitle(localized("done"), for: .normal)
    }

}
