import UIKit

@IBDesignable
class CircleButton: UIButton {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect.insetBy(dx: 5.0, dy: 5.0))
        path.lineWidth = 5.0
        UIColor.orange.setStroke()
        path.stroke()
    }

}
