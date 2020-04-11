import UIKit


final class Shapes {
    
    static func getPathBasedAt(_ index:Int,rect:CGRect) -> UIBezierPath {
        let linePath = UIBezierPath()
        switch index {
        case 0:
            linePath.move(to: CGPoint(x: rect.width/9, y: 0))
            linePath.addLine(to: CGPoint(x: rect.width/9, y: rect.height/9))
            linePath.addLine(to: CGPoint(x: rect.width*3/9, y: rect.height/9))
            linePath.addLine(to: CGPoint(x: rect.width*3/9, y: rect.height*2/9))
            linePath.addLine(to: CGPoint(x: rect.width*2/9, y: rect.height*2/9))
            linePath.addLine(to: CGPoint(x: rect.width*2/9, y: rect.height*4/9))
            linePath.addLine(to: CGPoint(x: rect.width/9, y: rect.height*4/9))
            linePath.addLine(to: CGPoint(x: rect.width/9, y: rect.height*5/9))
            linePath.addLine(to: CGPoint(x: 0, y: rect.height*5/9))
            
            linePath.move(to: CGPoint(x: rect.width*5/9, y: 0))
            linePath.addLine(to: CGPoint(x: rect.width*5/9, y: rect.height*2/9))
            linePath.addLine(to: CGPoint(x: rect.width*4/9, y: rect.height*2/9))
            linePath.addLine(to: CGPoint(x: rect.width*4/9, y: rect.height*3/9))
            linePath.addLine(to: CGPoint(x: rect.width*3/9, y: rect.height*3/9))
            linePath.addLine(to: CGPoint(x: rect.width*3/9, y: rect.height*4/9))
            linePath.addLine(to: CGPoint(x: rect.width*2/9, y: rect.height*4/9))
            
            linePath.move(to: CGPoint(x: rect.width*5/9, y: rect.height/9))
            linePath.addLine(to: CGPoint(x: rect.width*6/9, y: rect.height/9))
            linePath.addLine(to: CGPoint(x: rect.width*6/9, y: rect.height*3/9))
            linePath.addLine(to: CGPoint(x: rect.width*5/9, y: rect.height*3/9))
            linePath.addLine(to: CGPoint(x: rect.width*5/9, y: rect.height*5/9))
            linePath.addLine(to: CGPoint(x: rect.width*1/9, y: rect.height*5/9))

            linePath.move(to: CGPoint(x: rect.width*8/9, y: 0))
            linePath.addLine(to: CGPoint(x: rect.width*8/9, y: rect.height*3/9))
            linePath.addLine(to: CGPoint(x: rect.width*7/9, y: rect.height*3/9))
            linePath.addLine(to: CGPoint(x: rect.width*7/9, y: rect.height*4/9))
            linePath.addLine(to: CGPoint(x: rect.width*5/9, y: rect.height*4/9))

            linePath.moveTo(7, 4, rect)
            linePath.addLineTo(7, 5, rect)
            linePath.addLineTo(8, 5, rect)
            linePath.addLineTo(8, 7, rect)
            linePath.addLineTo(9, 7, rect)

            linePath.moveTo(2, 5, rect)
            linePath.addLineTo(2, 7, rect)
            linePath.addLineTo(3, 7, rect)
            linePath.addLineTo(3, 6, rect)
            linePath.addLineTo(8, 6, rect)

            linePath.moveTo(3, 7, rect)
            linePath.addLineTo(3, 8, rect)
            linePath.addLineTo(2, 8, rect)
            linePath.addLineTo(2, 9, rect)

            linePath.moveTo(6, 6, rect)
            linePath.addLineTo(6, 8, rect)
            linePath.addLineTo(5, 8, rect)
            linePath.addLineTo(5, 9, rect)
            
            linePath.lineWidth = Constants.doubleLineWidth
            return linePath
        case 1:            
            linePath.moveTo(0, 1, rect)
            linePath.addLineTo(1, 1, rect)
            linePath.addLineTo(1, 2, rect)
            linePath.addLineTo(2, 2, rect)
            linePath.addLineTo(2, 6, rect)
            linePath.addLineTo(0, 6, rect)

            linePath.moveTo(1, 6, rect)
            linePath.addLineTo(1, 8, rect)
            linePath.addLineTo(1, 8, rect)
            linePath.addLineTo(7, 8, rect)
            linePath.addLineTo(7, 9, rect)

            linePath.moveTo(5, 0, rect)
            linePath.addLineTo(5, 2, rect)
            linePath.addLineTo(2, 2, rect)

            linePath.moveTo(5, 1, rect)
            linePath.addLineTo(6, 1, rect)
            linePath.addLineTo(6, 4, rect)
            linePath.addLineTo(2, 4, rect)
            
            linePath.moveTo(6, 2, rect)
            linePath.addLineTo(7, 2, rect)
            linePath.addLineTo(7, 3, rect)
            linePath.addLineTo(9, 3, rect)
            
            linePath.moveTo(2, 5, rect)
            linePath.addLineTo(7, 5, rect)
            linePath.addLineTo(7, 4, rect)
            linePath.addLineTo(9, 4, rect)
            
            linePath.moveTo(5, 5, rect)
            linePath.addLineTo(5, 7, rect)
            linePath.addLineTo(3, 7, rect)
            linePath.addLineTo(3, 8, rect)
            
            linePath.moveTo(5, 7, rect)
            linePath.addLineTo(8, 7, rect)
            linePath.addLineTo(8, 6, rect)
            linePath.addLineTo(9, 6, rect)
            
        case 2:
            linePath.moveTo(0, 2, rect)
            linePath.addLineTo(1, 2, rect)
            linePath.addLineTo(1, 8, rect)
            linePath.addLineTo(3, 8, rect)
            linePath.addLineTo(3, 2, rect)
            linePath.addLineTo(2, 2, rect)
            linePath.addLineTo(2, 5, rect)
            linePath.addLineTo(1, 5, rect)

            linePath.moveTo(3, 0, rect)
            linePath.addLineTo(3, 2, rect)
            
            linePath.moveTo(3, 8, rect)
            linePath.addLineTo(3, 9, rect)
            
            linePath.moveTo(3, 1, rect)
            linePath.addLineTo(4, 1, rect)
            linePath.addLineTo(4, 3, rect)
            linePath.addLineTo(5, 3, rect)
            linePath.addLineTo(5, 4, rect)
            linePath.addLineTo(6, 4, rect)
            linePath.addLineTo(6, 3, rect)
            linePath.addLineTo(8, 3, rect)
            linePath.addLineTo(8, 1, rect)
            linePath.addLineTo(7, 1, rect)
            linePath.addLineTo(7, 2, rect)
            linePath.addLineTo(5, 2, rect)
            linePath.addLineTo(5, 0, rect)
            
            linePath.moveTo(4, 3, rect)
            linePath.addLineTo(4, 5, rect)
            linePath.addLineTo(4, 5, rect)
            linePath.addLineTo(6, 5, rect)
            linePath.addLineTo(6, 6, rect)
            linePath.addLineTo(4, 6, rect)
            linePath.addLineTo(4, 8, rect)
            linePath.addLineTo(3, 8, rect)

            linePath.moveTo(6, 6, rect)
            linePath.addLineTo(6, 8, rect)
            linePath.addLineTo(8, 8, rect)
            linePath.addLineTo(8, 9, rect)

            linePath.moveTo(6, 6, rect)
            linePath.addLineTo(8, 6, rect)
            linePath.addLineTo(8, 4, rect)
            linePath.addLineTo(9, 4, rect)
            
            linePath.moveTo(8, 3, rect)
            linePath.addLineTo(8, 4, rect)
        case 3:
            linePath.moveTo(0, 4, rect)
            linePath.addLineTo(1, 4, rect)
            linePath.addLineTo(1, 2, rect)
            linePath.addLineTo(2, 2, rect)
            linePath.addLineTo(2, 1, rect)
            linePath.addLineTo(3, 1, rect)
            linePath.addLineTo(3, 2, rect)
            linePath.addLineTo(4, 2, rect)
            linePath.addLineTo(4, 3, rect)
            linePath.addLineTo(2, 3, rect)
            linePath.addLineTo(2, 6, rect)
            linePath.addLineTo(0, 6, rect)

            linePath.moveTo(5, 0, rect)
            linePath.addLineTo(5, 1, rect)
            linePath.addLineTo(6, 1, rect)
            linePath.addLineTo(6, 3, rect)
            linePath.addLineTo(5, 3, rect)
            linePath.addLineTo(5, 4, rect)
            linePath.addLineTo(3, 4, rect)
            linePath.addLineTo(3, 8, rect)
            linePath.addLineTo(6, 8, rect)
            linePath.addLineTo(6, 7, rect)
            linePath.addLineTo(5, 7, rect)
            linePath.addLineTo(5, 6, rect)
            linePath.addLineTo(7, 6, rect)
            linePath.addLineTo(7, 5, rect)
            linePath.addLineTo(8, 5, rect)
            linePath.addLineTo(8, 3, rect)
            linePath.addLineTo(9, 3, rect)

            linePath.moveTo(3, 8, rect)
            linePath.addLineTo(2, 8, rect)
            linePath.addLineTo(2, 9, rect)

            linePath.moveTo(2, 5, rect)
            linePath.addLineTo(3, 5, rect)

            linePath.moveTo(4, 0, rect)
            linePath.addLineTo(4, 2, rect)

            linePath.moveTo(4, 4, rect)
            linePath.addLineTo(4,5, rect)
            linePath.addLineTo(6, 5, rect)
            linePath.addLineTo(6, 6, rect)
            
            linePath.moveTo(6, 7, rect)
            linePath.addLineTo(8, 7, rect)
            linePath.addLineTo(8, 8, rect)
            linePath.addLineTo(9, 8, rect)
            
            linePath.moveTo(8, 0, rect)
            linePath.addLineTo(8, 1, rect)
            linePath.addLineTo(7, 1, rect)
            linePath.addLineTo(7, 4, rect)
            linePath.addLineTo(6, 4, rect)
            linePath.addLineTo(6, 5, rect)



            
        default: return UIBezierPath()
        }
        linePath.lineWidth = Constants.doubleLineWidth
        return linePath
    }
    
}
