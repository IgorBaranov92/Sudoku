import UIKit

@IBDesignable
class ShapeView: UIView {

    override func draw(_ rect: CGRect) {
        let outerPath = UIBezierPath(rect: rect)
        outerPath.lineWidth = Constants.doubleLineWidth
        UIColor.border.setStroke()
        outerPath.stroke()
    }

}
