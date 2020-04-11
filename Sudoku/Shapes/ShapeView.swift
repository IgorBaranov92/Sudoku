import UIKit

@IBDesignable
class ShapeView: UIView {

    var id = 1 { didSet { setNeedsDisplay() }}
    
    override func draw(_ rect: CGRect) {
        let outerPath = UIBezierPath(rect: rect)
        outerPath.lineWidth = Constants.doubleLineWidth
        UIColor.border.setStroke()
        outerPath.stroke()
        
        for pivot in stride(from: 1/9*rect.width, to: rect.width, by: 1/9*rect.width) {
            let verticalPath = UIBezierPath()
            verticalPath.move(to: CGPoint(x: pivot, y: 0))
            verticalPath.addLine(to: CGPoint(x: pivot, y: rect.maxY))
            verticalPath.lineWidth = Constants.lineWidth
            UIColor.border.setStroke()
            verticalPath.stroke()
            
            let horizontalPath = UIBezierPath()
            horizontalPath.move(to: CGPoint(x: 0, y: pivot))
            horizontalPath.addLine(to: CGPoint(x: rect.maxX, y: pivot))
            horizontalPath.lineWidth = Constants.lineWidth
            horizontalPath.stroke()
        }
        UIColor.border.setStroke()
        Shapes.getPathBasedAt(id, rect: rect).stroke()
        
    }


}
