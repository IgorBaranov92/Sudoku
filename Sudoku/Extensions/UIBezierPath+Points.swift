import UIKit

extension UIBezierPath {
    
    func moveTo(_ x:Int,_ y:Int,_ rect:CGRect) {
        self.move(to: CGPoint(x: rect.width*x.cg/9.cg, y: rect.height*y.cg/9.cg))
    }
    
    func addLineTo(_ x:Int,_ y:Int,_ rect:CGRect) {
        self.addLine(to: CGPoint(x: rect.width*x.cg/9.cg, y: rect.height*y.cg/9.cg))
    }
}

extension Int {
    var cg: CGFloat { return CGFloat(self) }
}
