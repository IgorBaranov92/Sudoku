import UIKit

class Cell: UIButton {
    
    var active = false { didSet { setNeedsDisplay() }}
    var highlight = false { didSet { setNeedsDisplay() }}
    var isSelect = false { didSet { setNeedsDisplay() }}
    
    override func draw(_ rect: CGRect) {
        if active || isSelect {
            let path = UIBezierPath(rect: rect)
            UIColor.selection.setFill()
            path.fill()
        } else if highlight {
            let path = UIBezierPath(rect: rect)
            UIColor.highlight.setFill()
            path.fill()
        } else {
            let path = UIBezierPath(rect: rect)
            UIColor.clear.setFill()
            path.fill()
        }
    }
    

    
}


