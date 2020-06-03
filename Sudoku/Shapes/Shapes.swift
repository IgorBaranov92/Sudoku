import UIKit

//22,24,12,11,18,17,23,10,20,19,2,1

final class Shapes {
    
    static func getPathBasedAt(_ index:Int,rect:CGRect,width:CGFloat) -> UIBezierPath {
        let linePath = UIBezierPath()
        switch index {
        case 0:
            linePath.moveTo(1, 0, rect)
            linePath.addLineTo(1, 1, rect)
            linePath.addLineTo(3, 1, rect)
            linePath.addLineTo(3, 2, rect)
            linePath.addLineTo(2, 2, rect)
            linePath.addLineTo(2, 4, rect)
            linePath.addLineTo(3, 4, rect)
            linePath.addLineTo(3, 3, rect)
            linePath.addLineTo(4, 3, rect)
            linePath.addLineTo(4, 2, rect)
            linePath.addLineTo(5, 2, rect)
            linePath.addLineTo(5, 1, rect)
            linePath.addLineTo(6, 1, rect)
            linePath.addLineTo(6, 3, rect)
            linePath.addLineTo(5, 3, rect)
            linePath.addLineTo(5, 4, rect)
            linePath.addLineTo(7, 4, rect)
            linePath.addLineTo(7, 3, rect)
            linePath.addLineTo(8, 3, rect)
            linePath.addLineTo(8, 0, rect)
            
            linePath.moveTo(5, 0, rect)
            linePath.addLineTo(5, 1, rect)

            linePath.moveTo(0, 5, rect)
            linePath.addLineTo(5, 5, rect)
            linePath.addLineTo(5, 4, rect)

            linePath.moveTo(2, 4, rect)
            linePath.addLineTo(1, 4, rect)
            linePath.addLineTo(1, 5, rect)

            linePath.moveTo(2, 5, rect)
            linePath.addLineTo(2, 7, rect)
            linePath.addLineTo(3, 7, rect)
            linePath.addLineTo(3, 8, rect)
            linePath.addLineTo(2, 8, rect)
            linePath.addLineTo(2, 9, rect)

            linePath.moveTo(3, 7, rect)
            linePath.addLineTo(3, 6, rect)
            linePath.addLineTo(8, 6, rect)
            linePath.addLineTo(8, 7, rect)
            linePath.addLineTo(9, 7, rect)

            linePath.moveTo(6, 6, rect)
            linePath.addLineTo(6, 8, rect)
            linePath.addLineTo(5, 8, rect)
            linePath.addLineTo(5, 9, rect)

            linePath.moveTo(7, 4, rect)
            linePath.addLineTo(7, 5, rect)
            linePath.addLineTo(8, 5, rect)
            linePath.addLineTo(8, 6, rect)
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
            
            linePath.moveTo(0, 3, rect)
            linePath.addLineTo(1, 3, rect)
            linePath.addLineTo(1, 1, rect)
            linePath.addLineTo(3, 1, rect)
            linePath.addLineTo(3, 2, rect)
            linePath.addLineTo(4, 2, rect)
            linePath.addLineTo(4, 1, rect)
            linePath.addLineTo(6, 1, rect)
            linePath.addLineTo(6, 0, rect)

            linePath.moveTo(0, 7, rect)
            linePath.addLineTo(3, 7, rect)
            linePath.addLineTo(3, 6, rect)
            linePath.addLineTo(2, 6, rect)
            linePath.addLineTo(2, 5, rect)
            linePath.addLineTo(4, 5, rect)
            linePath.addLineTo(4, 2, rect)
            linePath.addLineTo(5, 2, rect)
            linePath.addLineTo(5, 5, rect)
            linePath.addLineTo(7, 5, rect)
            linePath.addLineTo(7, 6, rect)
            linePath.addLineTo(4, 6, rect)
            linePath.addLineTo(4, 7, rect)
            linePath.addLineTo(3, 7, rect)

            linePath.moveTo(0, 4, rect)
            linePath.addLineTo(4, 4, rect)

            linePath.moveTo(4, 7, rect)
            linePath.addLineTo(9, 7, rect)

            linePath.moveTo(5, 7, rect)
            linePath.addLineTo(5, 8, rect)
            linePath.addLineTo(4, 8, rect)
            linePath.addLineTo(4, 9, rect)

            linePath.moveTo(7, 0, rect)
            linePath.addLineTo(7, 4, rect)
            linePath.addLineTo(6, 4, rect)
            linePath.addLineTo(6, 5, rect)
            linePath.addLineTo(8, 5, rect)
            linePath.addLineTo(8, 3, rect)
            linePath.addLineTo(9, 3, rect)

        case 4:
            
            linePath.moveTo(2, 0, rect)
            linePath.addLineTo(2, 1, rect)
            linePath.addLineTo(1, 1, rect)
            linePath.addLineTo(1, 5, rect)
            linePath.addLineTo(4, 5, rect)
            linePath.addLineTo(4, 3, rect)
            linePath.addLineTo(5, 3, rect)
            linePath.addLineTo(5, 4, rect)
            linePath.addLineTo(6, 4, rect)
            linePath.addLineTo(6, 3, rect)
            linePath.addLineTo(7, 3, rect)
            linePath.addLineTo(7, 2, rect)
            linePath.addLineTo(5, 2, rect)
            linePath.addLineTo(5, 1, rect)
            linePath.addLineTo(3, 1, rect)
            linePath.addLineTo(3, 0, rect)

            linePath.moveTo(3, 1, rect)
            linePath.addLineTo(3, 6, rect)
            linePath.addLineTo(0, 6, rect)

            linePath.moveTo(0, 7, rect)
            linePath.addLineTo(9, 7, rect)

            linePath.moveTo(4, 7, rect)
            linePath.addLineTo(4, 8, rect)
            linePath.addLineTo(5, 8, rect)
            linePath.addLineTo(5, 9, rect)

            linePath.moveTo(4, 5, rect)
            linePath.addLineTo(6, 5, rect)
            linePath.addLineTo(6, 7, rect)

            linePath.moveTo(7, 3, rect)
            linePath.addLineTo(7, 6, rect)
            linePath.addLineTo(9, 6, rect)

            linePath.moveTo(6, 2, rect)
            linePath.addLineTo(6, 1, rect)
            linePath.addLineTo(8, 1, rect)
            linePath.addLineTo(8, 3, rect)
            linePath.addLineTo(9, 3, rect)
    
        case 5:
            
            linePath.moveTo(2, 0, rect)
            linePath.addLineTo(2, 9, rect)

            linePath.moveTo(2, 2, rect)
            linePath.addLineTo(1, 2, rect)
            linePath.addLineTo(1, 7, rect)
            linePath.addLineTo(0, 7, rect)

            linePath.moveTo(2, 7, rect)
            linePath.addLineTo(3, 7, rect)
            linePath.addLineTo(3, 3, rect)
            linePath.addLineTo(4, 3, rect)
            linePath.addLineTo(4, 2, rect)
            linePath.addLineTo(3, 2, rect)
            linePath.addLineTo(3, 1, rect)
            linePath.addLineTo(4, 1, rect)
            linePath.addLineTo(4, 0, rect)

            linePath.moveTo(3, 3, rect)
            linePath.addLineTo(3, 5, rect)
            linePath.addLineTo(5, 5, rect)
            linePath.addLineTo(5, 7, rect)
            linePath.addLineTo(6, 7, rect)
            linePath.addLineTo(6, 5, rect)
            linePath.addLineTo(8, 5, rect)
            linePath.addLineTo(8, 4, rect)
            linePath.addLineTo(6, 4, rect)
            linePath.addLineTo(6, 3, rect)
            linePath.addLineTo(5, 3, rect)
            linePath.addLineTo(5, 4, rect)
            linePath.addLineTo(4, 4, rect)
            linePath.addLineTo(4, 3, rect)
            
            linePath.moveTo(5, 7, rect)
            linePath.addLineTo(5, 8, rect)
            linePath.addLineTo(4, 8, rect)
            linePath.addLineTo(4, 9, rect)

            linePath.moveTo(6, 7, rect)
            linePath.addLineTo(6, 8, rect)
            linePath.addLineTo(7, 8, rect)
            linePath.addLineTo(7, 6, rect)
            linePath.addLineTo(8, 6, rect)
            linePath.addLineTo(8, 6, rect)
            linePath.addLineTo(8, 7, rect)
            linePath.addLineTo(9, 7, rect)

            linePath.moveTo(6, 0, rect)
            linePath.addLineTo(6, 1, rect)
            linePath.addLineTo(5, 1, rect)
            linePath.addLineTo(5, 2, rect)
            linePath.addLineTo(7, 2, rect)
            linePath.addLineTo(7, 4, rect)
            linePath.addLineTo(8, 4, rect)
            linePath.addLineTo(8, 2, rect)
            linePath.addLineTo(9, 2, rect)

        case 6:
            
            linePath.moveTo(1, 0, rect)
            linePath.addLineTo(1, 4, rect)
            linePath.addLineTo(2, 4, rect)
            linePath.addLineTo(2, 5, rect)
            linePath.addLineTo(1, 5, rect)
            linePath.addLineTo(1, 6, rect)
            linePath.addLineTo(2, 6, rect)
            linePath.addLineTo(2, 7, rect)
            linePath.addLineTo(0, 7, rect)

            linePath.moveTo(3, 0, rect)
            linePath.addLineTo(3, 1, rect)
            linePath.addLineTo(2, 1, rect)
            linePath.addLineTo(2, 3, rect)
            linePath.addLineTo(3, 3, rect)
            linePath.addLineTo(3, 7, rect)
            linePath.addLineTo(4, 7, rect)
            linePath.addLineTo(4, 6, rect)
            linePath.addLineTo(5, 6, rect)
            linePath.addLineTo(5, 4, rect)
            linePath.addLineTo(7, 4, rect)
            linePath.addLineTo(7, 3, rect)
            linePath.addLineTo(6, 3, rect)
            linePath.addLineTo(6, 1, rect)
            linePath.addLineTo(4, 1, rect)

            linePath.moveTo(4, 0, rect)
            linePath.addLineTo(4, 9, rect)
            
            linePath.moveTo(2, 6, rect)
            linePath.addLineTo(3, 6, rect)
            
            linePath.moveTo(4, 7, rect)
            linePath.addLineTo(8, 7, rect)
            linePath.addLineTo(8, 8, rect)
            linePath.addLineTo(9, 8, rect)

            linePath.moveTo(6, 1, rect)
            linePath.addLineTo(7, 1, rect)
            linePath.addLineTo(7, 2, rect)
            linePath.addLineTo(8, 2, rect)
            linePath.addLineTo(8, 4, rect)
            linePath.addLineTo(9, 4, rect)

            linePath.moveTo(5, 6, rect)
            linePath.addLineTo(6, 6, rect)
            linePath.addLineTo(6, 5, rect)
            linePath.addLineTo(9, 5, rect)
    

        case 7:
            
            linePath.moveTo(1, 0, rect)
            linePath.addLineTo(1, 4, rect)
            linePath.addLineTo(2, 4, rect)
            linePath.addLineTo(2, 6, rect)
            linePath.addLineTo(1, 6, rect)
            linePath.addLineTo(1, 7, rect)
            linePath.addLineTo(0, 7, rect)

            linePath.moveTo(5, 0, rect)
            linePath.addLineTo(5, 1, rect)
            linePath.addLineTo(4, 1, rect)
            linePath.addLineTo(4, 3, rect)
            linePath.addLineTo(3, 3, rect)
            linePath.addLineTo(3, 1, rect)
            linePath.addLineTo(2, 1, rect)
            linePath.addLineTo(2, 8, rect)
            linePath.addLineTo(3, 8, rect)
            linePath.addLineTo(3, 5, rect)
            linePath.addLineTo(4, 5, rect)
            linePath.addLineTo(4, 3, rect)
            
            linePath.moveTo(5, 1, rect)
            linePath.addLineTo(5, 5, rect)
            linePath.addLineTo(6, 5, rect)
            linePath.addLineTo(6, 1, rect)
            linePath.addLineTo(7, 1, rect)
            linePath.addLineTo(7, 2, rect)
            linePath.addLineTo(8, 2, rect)
            linePath.addLineTo(8, 1, rect)
            linePath.addLineTo(9, 1, rect)

            linePath.moveTo(6, 5, rect)
            linePath.addLineTo(8, 5, rect)
            linePath.addLineTo(8, 3, rect)
            linePath.addLineTo(9, 3, rect)
            
            linePath.moveTo(3, 8, rect)
            linePath.addLineTo(6, 8, rect)
            linePath.addLineTo(6, 9, rect)

            linePath.moveTo(3, 6, rect)
            linePath.addLineTo(4, 6, rect)
            linePath.addLineTo(4, 7, rect)
            linePath.addLineTo(5, 7, rect)
            linePath.addLineTo(5, 6, rect)
            linePath.addLineTo(6, 6, rect)
            linePath.addLineTo(7, 6, rect)
            linePath.addLineTo(7, 5, rect)

            linePath.moveTo(6, 6, rect)
            linePath.addLineTo(6, 7, rect)
            linePath.addLineTo(7, 7, rect)
            linePath.addLineTo(7, 8, rect)
            linePath.addLineTo(9, 8, rect)



            
        default: return UIBezierPath()
        }
        linePath.lineWidth = width
        return linePath
    }
    
}
