import UIKit

@IBDesignable
class Hexagon: UIView {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.midX, y: 1/18*rect.height))
        path.addLine(to: CGPoint(x: 3/18*rect.width, y: 3/18*rect.height))
        path.addLine(to: CGPoint(x: 1/18*rect.width, y: 9/18*rect.height))
        path.addLine(to: CGPoint(x: 3/18*rect.width, y: 15/18*rect.height))
        path.addLine(to: CGPoint(x: rect.midX, y: 17/18*rect.height))
        path.addLine(to: CGPoint(x: 15/18*rect.width, y: 15/18*rect.height))
        path.addLine(to: CGPoint(x: 17/18*rect.width, y: 9/18*rect.height))
        path.addLine(to: CGPoint(x: 15/18*rect.width, y: 3/18*rect.height))
        path.close()
        path.lineWidth = 0.5
        UIColor.black.setStroke()
        path.stroke()

    }

}
