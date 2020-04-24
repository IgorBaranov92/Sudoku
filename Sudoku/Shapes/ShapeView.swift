import UIKit

@IBDesignable
class ShapeView: SudokuView {

    @IBInspectable
    var id: Int = 0 { didSet { setNeedsDisplay() }}
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        UIColor.border.setStroke()
        Shapes.getPathBasedAt(id, rect: rect,width: 2.5).stroke()
    }


}
