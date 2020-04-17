import UIKit

@IBDesignable
class ShapeView: SudokuView {

    var id = 0 { didSet { setNeedsDisplay() }}
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        UIColor.border.setStroke()
        Shapes.getPathBasedAt(id, rect: rect).stroke()
        
    }


}
