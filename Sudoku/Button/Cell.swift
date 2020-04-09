import UIKit


class Cell: BorderedCell {
    
    var active = false { didSet { setNeedsDisplay() }}
    var highlight = false { didSet { setNeedsDisplay() }}
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if active {
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        layer.borderWidth = UIDevice.isIpad ? 0.5 : 0.25
        layer.borderColor = UIColor.border.cgColor
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setTitleColor(.text, for: .normal)
    }
    
    
}
