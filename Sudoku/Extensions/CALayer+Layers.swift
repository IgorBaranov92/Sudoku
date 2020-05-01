import UIKit

extension CALayer {
    func addLineAt(edge:UIRectEdge,width:CGFloat) {
        let subLayer = CALayer()
        switch edge {
        case .top:
            subLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: width)
        case .right:
            subLayer.frame = CGRect(x: frame.width - width, y: 0, width: width, height: frame.height)
        case .left:
            subLayer.frame = CGRect(x: 0, y: 0, width: width, height: frame.height)
        case .bottom:
            subLayer.frame = CGRect(x: 0, y: frame.height-width, width: frame.width, height: width)
        default:break
        }
        subLayer.name = "border"
        subLayer.backgroundColor = UIColor.border.cgColor
        addSublayer(subLayer)
    }
    
    func addDiagonalAt(edge:LayerType,width:CGFloat) {
        let subLayer = CAShapeLayer()
        let path = CGMutablePath()
        let upperLeft = CGPoint.zero
        let upperRight = CGPoint(x: frame.width, y: 0)
        let lowerLeft = CGPoint(x: 0, y: frame.height)
        let lowerRight = CGPoint(x: frame.width, y: frame.height)
        let center = CGPoint(x: frame.width/2, y: frame.height/2)
        switch edge {
        case .leftDiagonal:
            path.move(to: upperLeft)
            path.addLine(to: lowerRight)
        case .rightDiagonal:
            path.move(to: lowerLeft)
            path.addLine(to: upperRight)
        case .leftAngle:
            path.move(to: lowerRight)
            path.addLine(to: center)
            let p1 = CGMutablePath()
            p1.move(to: center)
            p1.addLine(to: upperRight)
            path.addPath(p1)
        case .rightAngle:
            path.move(to: lowerLeft)
            path.addLine(to: center)
            let p1 = CGMutablePath()
            p1.move(to: center)
            p1.addLine(to: upperLeft)
            path.addPath(p1)
        case .topAngle:
            path.move(to: lowerLeft)
            path.addLine(to: center)
            let p1 = CGMutablePath()
            p1.move(to: center)
            p1.addLine(to: lowerRight)
            path.addPath(p1)
        case .bottomAngle:
            path.move(to: upperLeft)
            path.addLine(to: center)
            let p1 = CGMutablePath()
            p1.move(to: center)
            p1.addLine(to: upperRight)
            path.addPath(p1)
        }
        
        subLayer.path = path
        subLayer.strokeColor = UIColor.diagonal.cgColor
        subLayer.name = edge.rawValue
        insertSublayer(subLayer, at: 0)
    }
    


    
    
    func addVertical(width:CGFloat,start:CGPoint,end:CGPoint) {
        let subLayer = CAShapeLayer()
        let path = CGMutablePath()
        path.move(to: start)
        path.addLine(to: end)
        subLayer.path = path
        subLayer.lineWidth = width
        subLayer.strokeColor = UIColor.border.cgColor
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
        print(rect)
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
        subLayer.strokeColor = UIColor.border.cgColor
        insertSublayer(subLayer, at: 0)
    }
    
    
    enum LayerType:String {
        case leftDiagonal
        case rightDiagonal
        case leftAngle
        case rightAngle
        case topAngle
        case bottomAngle
    }

}


