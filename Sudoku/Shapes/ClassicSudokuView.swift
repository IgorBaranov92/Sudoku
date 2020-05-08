import UIKit

class ClassicSudokuView: SudokuView {

    var type: GameType = .classic { didSet { setNeedsDisplay() }}
    
    var id = 0 { didSet { setNeedsDisplay() }}
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if type != .shape { drawGridAt(rect) }
        switch type {
        case .diagonal: layer.addDiagonalsAt(rect, lineWidth: 1)
        case .twoDiagonals: layer.addTwoDiagonalsAt(rect, lineWidth: 1)
        case .romb: layer.addRombAt(rect, lineWidth: 1)
        case .hexagon: layer.addHexagonAt(rect, lineWidth: 1)
        case .shape:
            UIColor.dynamicBlack.setStroke()
            Shapes.getPathBasedAt(id, rect: rect,width: 2.5).stroke()
        default:break
        }
    }

}
