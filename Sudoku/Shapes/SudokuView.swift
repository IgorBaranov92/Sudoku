import UIKit

class SudokuView: UIView {

    override func draw(_ rect: CGRect) {
        layer.addBorderAt(rect.insetBy(dx: 1.0, dy: 1.0), lineWidth: Constants.doubleLineWidth)
        for pivot in stride(from: 1/9*rect.width, to: rect.width, by: 1/9*rect.width) {
            layer.addVertical(width: Constants.lineWidth, start: CGPoint(x: pivot, y: 0), end: CGPoint(x: pivot, y: rect.maxY))
            layer.addVertical(width: Constants.lineWidth, start: CGPoint(x: 0, y: pivot), end: CGPoint(x: rect.maxX, y: pivot))
        }
    }

}
