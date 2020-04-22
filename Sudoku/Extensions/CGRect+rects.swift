import UIKit


extension CGRect {
    var center:CGPoint {
        CGPoint(x: midX, y: midY)
    }
    
    var maxPoint: CGPoint {
        return CGPoint(x: maxX, y: maxY)
    }
    
    var upperRight: CGPoint {
        return CGPoint(x: maxX, y: 0)
    }
    
    var lowerLeft: CGPoint {
        return CGPoint(x: 0, y: maxY)
    }
    
}
