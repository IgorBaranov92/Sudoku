import UIKit

@IBDesignable
class SudokuView: UIView {

    var type: GameType = .classic { didSet { setNeedsDisplay() }}
    var id = 0 { didSet { setNeedsDisplay() }}
    
    override func draw(_ rect: CGRect) {
        drawBasedAt(rect)
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

    private func drawGridAt(_ rect:CGRect) {
        
       for pivot in stride(from: 1/3*rect.width, to: rect.width, by: 1/3*rect.width) {
           layer.addVertical(width: Constants.doubleLineWidth, start: CGPoint(x: pivot, y: 0), end: CGPoint(x: pivot, y: rect.maxY))
           layer.addVertical(width: Constants.doubleLineWidth, start: CGPoint(x: 0, y: pivot), end: CGPoint(x: rect.maxX, y: pivot))
       }
   }
    
    private func drawBasedAt(_ rect:CGRect) {
        removeLayer(layerName: "sudokuBorder")
        removeLayer(layerName: "vertical")
        layer.addBorderAt(rect.insetBy(dx: 1.0, dy: 1.0), lineWidth: Constants.doubleLineWidth)
        for pivot in stride(from: 1/9*rect.width, to: rect.width, by: 1/9*rect.width) {
            layer.addVertical(width: Constants.lineWidth, start: CGPoint(x: pivot, y: 0), end: CGPoint(x: pivot, y: rect.maxY))
            layer.addVertical(width: Constants.lineWidth, start: CGPoint(x: 0, y: pivot), end: CGPoint(x: rect.maxX, y: pivot))
        }
    }
    
    
}
