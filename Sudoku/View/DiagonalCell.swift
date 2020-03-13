import UIKit

@IBDesignable
class DiagonalCell: Cell {

    @IBInspectable
    var needsLeftDiagonal: Bool = false { didSet { setNeedsDisplay()}}
      
    @IBInspectable
    var needsRightDiagonal: Bool = false { didSet { setNeedsDisplay()}}
          
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if needsLeftDiagonal {
            layer.addDiagonalAt(edge: .top, width: 1.0)
        }
        if needsRightDiagonal {
            layer.addDiagonalAt(edge: .bottom, width: 1.0)
        }
    }
    

}
