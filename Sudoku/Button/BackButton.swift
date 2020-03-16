import UIKit

@IBDesignable
class BackButton: UIButton {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.maxX, y: 0))
        path.addLine(to: CGPoint(x: bounds.midX, y: bounds.midY))
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
        path.lineWidth = 5.0
        UIColor.black.setStroke()
        path.stroke()
    }
    
    
}
