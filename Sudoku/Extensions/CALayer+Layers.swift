import UIKit

extension CALayer {
    
    func addVertical(width:CGFloat,start:CGPoint,end:CGPoint) {
        let subLayer = CAShapeLayer()
        let path = CGMutablePath()
        path.move(to: start)
        path.addLine(to: end)
        subLayer.path = path
        subLayer.lineWidth = width
        subLayer.strokeColor = UIColor.dynamicBlack.cgColor
        subLayer.name = "vertical"
        addSublayer(subLayer)
    }
    
    func addRombAt(_ rect:CGRect,lineWidth:CGFloat) {
        let subLayer = CAShapeLayer()
        let path = CGMutablePath()
        path.move(to: CGPoint(x: rect.midX, y: 1/18*rect.height))
        path.addLine(to: CGPoint(x: 1/18*rect.width, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: 17/18*rect.height))
        path.addLine(to: CGPoint(x: 17/18*rect.width, y: rect.midY))
        path.closeSubpath()
        subLayer.path = path
        subLayer.lineWidth = lineWidth
        subLayer.fillColor = UIColor.clear.cgColor
        subLayer.strokeColor = UIColor.diagonal.cgColor
        insertSublayer(subLayer, at: 0)
    }
    
    func addDiagonalsAt(_ rect:CGRect,lineWidth:CGFloat) {
        let subLayer = CAShapeLayer()
        let path = CGMutablePath()
        path.move(to: rect.origin)
        path.addLine(to: rect.maxPoint)
        path.move(to: rect.lowerLeft)
        path.addLine(to: rect.upperRight)
        subLayer.path = path
        subLayer.lineWidth = lineWidth
        subLayer.fillColor = UIColor.clear.cgColor
        subLayer.strokeColor = UIColor.diagonal.cgColor
        insertSublayer(subLayer, at: 0)
    }
    
    func addHexagonAt(_ rect:CGRect,lineWidth:CGFloat) {
        let subLayer = CAShapeLayer()
        let path = CGMutablePath()
        path.move(to: CGPoint(x: rect.midX, y: 1/18*rect.height))
        path.addLine(to: CGPoint(x: 3/18*rect.width, y: 3/18*rect.height))
        path.addLine(to: CGPoint(x: 1/18*rect.width, y: 9/18*rect.height))
        path.addLine(to: CGPoint(x: 3/18*rect.width, y: 15/18*rect.height))
        path.addLine(to: CGPoint(x: rect.midX, y: 17/18*rect.height))
        path.addLine(to: CGPoint(x: 15/18*rect.width, y: 15/18*rect.height))
        path.addLine(to: CGPoint(x: 17/18*rect.width, y: 9/18*rect.height))
        path.addLine(to: CGPoint(x: 15/18*rect.width, y: 3/18*rect.height))
        path.closeSubpath()
        subLayer.path = path
        subLayer.lineWidth = lineWidth
        subLayer.fillColor = UIColor.clear.cgColor
        subLayer.strokeColor = UIColor.diagonal.cgColor
        subLayer.name = "hexagon"
        insertSublayer(subLayer, at: 0)
    }
    
    func addTwoDiagonalsAt(_ rect:CGRect,lineWidth:CGFloat) {
        let subLayer = CAShapeLayer()
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 8/9*rect.height))
        path.addLine(to: CGPoint(x: 8/9*rect.width, y: 0))
        path.move(to: CGPoint(x: rect.maxX, y: 1/9*rect.height))
        path.addLine(to: CGPoint(x: 1/9*rect.width, y: rect.maxY))
        path.move(to: CGPoint(x: 8/9*rect.width, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: 1/9*rect.height))
        path.move(to: CGPoint(x: 1/9*rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: 8/9*rect.height))
        subLayer.path = path
        subLayer.lineWidth = lineWidth
        subLayer.fillColor = UIColor.clear.cgColor
        subLayer.strokeColor = UIColor.diagonal.cgColor
        insertSublayer(subLayer, at: 0)
    }
    
    func addBorderAt(_ rect:CGRect,lineWidth:CGFloat) {
        let subLayer = CAShapeLayer()
        let path = CGMutablePath()
        path.move(to: rect.origin)
        path.addLine(to: rect.upperRight)
        path.addLine(to: rect.maxPoint)
        path.addLine(to: rect.lowerLeft)
        path.closeSubpath()
        subLayer.path = path
        subLayer.lineWidth = lineWidth
        subLayer.fillColor = UIColor.clear.cgColor
        subLayer.strokeColor = UIColor.dynamicBlack.cgColor
        subLayer.name = "sudokuBorder"
        insertSublayer(subLayer, at: 0)
    }
    

}


