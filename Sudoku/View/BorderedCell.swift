import UIKit

@IBDesignable
class BorderedCell: UIButton {

    @IBInspectable
    var line1:Int = 0 { didSet { setNeedsDisplay() }}
    
    @IBInspectable
    var line2:Int = 0 { didSet { setNeedsDisplay() }}
    
    @IBInspectable
    var needsLeftDiagonal: Bool = false { didSet { setNeedsDisplay()}}
    
    @IBInspectable
    var needsRightDiagonal: Bool = false { didSet { setNeedsDisplay()}}
    
    var expert = false { didSet { setNeedsDisplay() }}
    
    private let lineWidth: CGFloat = UIDevice.isIpad ? 4 : 2
    private let diagonalLineWidth: CGFloat = 0.5

    
    override func draw(_ rect: CGRect) {
        removeLayer(layerName: "border")
        removeLayer(layerName: "diagonal")
        switch line1 {
        case 1: layer.addLineAt(edge: .top, width: lineWidth)
        case 2: layer.addLineAt(edge: .right, width: lineWidth)
        case 3: layer.addLineAt(edge: .left, width: lineWidth)
        case 4: layer.addLineAt(edge: .bottom, width: lineWidth)
        default:break
        }
        switch line2 {
        case 1: layer.addLineAt(edge: .top, width: lineWidth)
        case 2: layer.addLineAt(edge: .right, width: lineWidth)
        case 3: layer.addLineAt(edge: .left, width: lineWidth)
        case 4: layer.addLineAt(edge: .bottom, width: lineWidth)
        default:break
        }
        if needsLeftDiagonal && expert { layer.addDiagonalAt(edge: .top, width: diagonalLineWidth) }
        if needsRightDiagonal && expert { layer.addDiagonalAt(edge: .bottom, width: diagonalLineWidth) }
    }


    
}



