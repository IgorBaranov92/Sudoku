import UIKit

class ShapeButton: Cell {
    
    var lines: (first:Int,second:Int,third:Int) = (0,0,0) { didSet { setNeedsDisplay()}}

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        switch lines.first {
            case 1: layer.addLineAt(edge: .top, width: lineWidth)
            case 2: layer.addLineAt(edge: .left, width: lineWidth)
            case 3: layer.addLineAt(edge: .right, width: lineWidth)
            case 4: layer.addLineAt(edge: .bottom, width: lineWidth)
        default:break
        }
        switch lines.second {
            case 1: layer.addLineAt(edge: .top, width: lineWidth)
            case 2: layer.addLineAt(edge: .left, width: lineWidth)
            case 3: layer.addLineAt(edge: .right, width: lineWidth)
            case 4: layer.addLineAt(edge: .bottom, width: lineWidth)
        default:break
        }
        switch lines.third {
            case 1: layer.addLineAt(edge: .top, width: lineWidth)
            case 2: layer.addLineAt(edge: .left, width: lineWidth)
            case 3: layer.addLineAt(edge: .right, width: lineWidth)
            case 4: layer.addLineAt(edge: .bottom, width: lineWidth)
        default:break
        }
    }

}
