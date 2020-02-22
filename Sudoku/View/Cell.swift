import UIKit


class Cell: BorderedCell {
    
    var active = false { didSet { setNeedsDisplay() }}
    var highlight = false { didSet { setNeedsDisplay() }}
    var hinted = false { didSet { setNeedsDisplay() }}
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if active || hinted {
            let path = UIBezierPath(rect: rect)
            if #available(iOS 13.0, *) {
                Colors.dynamicSelectionColor.setFill()
            } else {
                #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1).setFill()
            }
            path.fill()
        } else if highlight {
            let path = UIBezierPath(rect: rect)
            if #available(iOS 13.0, *) {
                Colors.dynamicHighlightColor.setFill()
            } else {
                #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1).setFill()
            }
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
        if #available(iOS 13.0, *) {
            layer.borderColor = Colors.dynamicBorderColor.cgColor
        } else {
            layer.borderColor = UIColor.black.cgColor
        }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if #available(iOS 13.0, *) {
            setTitleColor(Colors.dynamicTextColor, for: .normal)
        }
    }
    
    
}
