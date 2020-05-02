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
            UIColor.black.setStroke()
            Shapes.getPathBasedAt(0, rect: rect,width: 1.5).stroke()
        default: break
        }
        
        
    }
    
    private func drawGridAt(_ rect:CGRect) {
        for pivot in stride(from: 1/3*rect.width, to: rect.width, by: 1/3*rect.width) {
            layer.addVertical(width: Constants.doubleLineWidth, start: CGPoint(x: pivot, y: 0), end: CGPoint(x: pivot, y: rect.maxY))
            layer.addVertical(width: Constants.doubleLineWidth, start: CGPoint(x: 0, y: pivot), end: CGPoint(x: rect.maxX, y: pivot))
        }
    }
    
    
}
