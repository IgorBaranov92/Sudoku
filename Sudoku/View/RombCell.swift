import UIKit

@IBDesignable
class RombCell: DiagonalCell {

    @IBInspectable
    var left: Bool = false { didSet { setNeedsDisplay() }}
    
    @IBInspectable
    var right: Bool = false { didSet { setNeedsDisplay()}}
    
    @IBInspectable
     var top: Bool = false { didSet { setNeedsDisplay() }}
     
     @IBInspectable
     var bottom: Bool = false { didSet { setNeedsDisplay()}}
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if left {
            layer.addDiagonalAt(edge: .leftAngle, width: Constants.lineWidthForDiagonal)
        }
        if right {
            layer.addDiagonalAt(edge: .rightAngle, width: Constants.lineWidthForDiagonal)
        }
        if top {
            layer.addDiagonalAt(edge: .topAngle, width: Constants.lineWidthForDiagonal)
        }
        if bottom {
            layer.addDiagonalAt(edge: .bottomAngle, width: Constants.lineWidthForDiagonal)
        }
    }

}
