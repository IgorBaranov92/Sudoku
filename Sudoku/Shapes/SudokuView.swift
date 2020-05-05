import UIKit

@IBDesignable
class SudokuView: UIView {

    override func draw(_ rect: CGRect) {
        removeLayer(layerName: "sudokuBorder")
        removeLayer(layerName: "vertical")
        layer.addBorderAt(rect.insetBy(dx: 1.0, dy: 1.0), lineWidth: Constants.doubleLineWidth)
        for pivot in stride(from: 1/9*rect.width, to: rect.width, by: 1/9*rect.width) {
            layer.addVertical(width: Constants.lineWidth, start: CGPoint(x: pivot, y: 0), end: CGPoint(x: pivot, y: rect.maxY))
            layer.addVertical(width: Constants.lineWidth, start: CGPoint(x: 0, y: pivot), end: CGPoint(x: rect.maxX, y: pivot))
        }
    }

    func drawGridAt(_ rect:CGRect) {
       for pivot in stride(from: 1/3*rect.width, to: rect.width, by: 1/3*rect.width) {
           layer.addVertical(width: Constants.doubleLineWidth, start: CGPoint(x: pivot, y: 0), end: CGPoint(x: pivot, y: rect.maxY))
           layer.addVertical(width: Constants.doubleLineWidth, start: CGPoint(x: 0, y: pivot), end: CGPoint(x: rect.maxX, y: pivot))
       }
   }
}
