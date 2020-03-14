import UIKit

class Hexagon: UIView {

    private lazy var p1 = CGPoint(x: bounds.width/4, y: 0)
    private lazy var p2 = CGPoint(x: bounds.width*3/4, y: 0)
    private lazy var p3 = CGPoint(x: 0, y: bounds.midY)
    private lazy var p4 = CGPoint(x: bounds.maxX, y: bounds.midY)
    private lazy var p5 = CGPoint(x: bounds.width/4, y: bounds.maxY)
    private lazy var p6 = CGPoint(x: bounds.width*3/4, y: bounds.maxY)

    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: p1)
        path.addLine(to: p2)
        path.addLine(to: p4)
        path.addLine(to: p6)
        path.addLine(to: p5)
        path.addLine(to: p3)
        path.close()
        path.lineWidth = 2.0
        UIColor.black.setStroke()
        path.stroke()
        drawLineBetween(p1, p6)
        drawLineBetween(p2, p5)
        drawLineBetween(p3, p4)
    }

   
    private func drawLineBetween(_ p1: CGPoint,_ p2: CGPoint) {
        let path = UIBezierPath()
        path.move(to: p1)
        path.addLine(to: p2)
        path.lineWidth = 2.0
        UIColor.black.setStroke()
        path.stroke()
    }
    

}

extension CGRect {
    var center:CGPoint {
        CGPoint(x: midX, y: midY)
    }
}
