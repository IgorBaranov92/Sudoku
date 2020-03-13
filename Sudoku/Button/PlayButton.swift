import UIKit

@IBDesignable
class PlayButton: CircleButton {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let trianglePath = UIBezierPath()
        trianglePath.move(to: CGPoint(x: 0.4*bounds.width, y: 0.3*bounds.height))
        trianglePath.addLine(to: CGPoint(x: 0.7*bounds.width, y: 0.5*bounds.height))
        trianglePath.addLine(to: CGPoint(x: 0.4*bounds.width, y: 0.7*bounds.height))
        trianglePath.close()
        UIColor.orange.setFill()
        trianglePath.fill()
        
    }

}
