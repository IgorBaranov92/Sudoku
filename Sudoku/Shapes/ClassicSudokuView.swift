import UIKit

class ClassicSudokuView: SudokuView {

    var type: GameType = .classic { didSet { setNeedsDisplay() }}
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        switch type {
        case .diagonal: layer.addDiagonalsAt(rect, lineWidth: 1)
        case .twoDiagonals: layer.addTwoDiagonalsAt(rect, lineWidth: 1)
        case .romb: layer.addRombAt(rect, lineWidth: 1)
        case .hexagon: layer.addHexagonAt(rect, lineWidth: 1)
        default:break
        }
    }

}
