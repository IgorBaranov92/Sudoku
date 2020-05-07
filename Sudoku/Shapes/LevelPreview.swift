import UIKit

class LevelPreview: SudokuView {

    var id = 0 { didSet { setNeedsDisplay() }}
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if id != 5 { drawGridAt(rect)}
        switch id {
        case 1:
            layer.addDiagonalsAt(rect, lineWidth: 1)
        case 2:
            layer.addTwoDiagonalsAt(rect, lineWidth: 1)
        case 3:
            layer.addRombAt(rect, lineWidth: 1)
        case 4:
            layer.addHexagonAt(rect, lineWidth: 1)
        case 5:
            UIColor.dynamicBlack.setStroke()
            Shapes.getPathBasedAt(0, rect: rect,width: 2.5).stroke()
        default: break
        }
        
        
    }
    
   
    
    
}
