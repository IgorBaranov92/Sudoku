import UIKit

@IBDesignable
class BackButton: UIButton {

    override func draw(_ rect: CGRect) {
        let triangle = UIBezierPath()
        triangle.move(to: CGPoint(x: 0.5*bounds.width, y: 0.3*bounds.height))
        triangle.addLine(to: CGPoint(x: 0.15*bounds.width, y: 0.5*bounds.height))
        triangle.addLine(to: CGPoint(x: 0.5*bounds.width, y: 0.7*bounds.height))
        triangle.close()
        let curve = UIBezierPath()
        curve.move(to: CGPoint(x: 0.5*bounds.width, y: 0.4*bounds.height))
        
        curve.addCurve(to: CGPoint(x: 0.75*bounds.width, y: 0.75*bounds.height),
                 controlPoint1: CGPoint(x: 0.8*bounds.width, y: 0.5*bounds.height),
                 controlPoint2: CGPoint(x: 0.72*bounds.width, y: 0.6*bounds.height))
        
        curve.addCurve(to: CGPoint(x: 0.5*bounds.width, y: 0.6*bounds.width),
            controlPoint1: CGPoint(x: 0.6*bounds.width, y: 0.6*bounds.height),
            controlPoint2: CGPoint(x: 0.55*bounds.width, y: 0.6*bounds.height))
        
        UIColor.black.setFill()
        triangle.fill()
        curve.fill()
    }
    
    
}
