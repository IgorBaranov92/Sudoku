import UIKit

class LevelCell: Cell {

    @IBInspectable
    var colorable: Bool = false { didSet { setNeedsDisplay()}}
    
    @IBInspectable
    var text: String = " " { didSet { setNeedsDisplay() }}
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setTitle(text, for: .normal)
        if colorable { layer.addColorLayer(rect) }
    }

}
