import UIKit


class Cell: BorderedCell {
    
    var active = false { didSet { setNeedsDisplay() }}
    var highlight = false { didSet { setNeedsDisplay() }}
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if active {
            let path = UIBezierPath(rect: rect)
            #colorLiteral(red: 0.4670000076, green: 0.7649999857, blue: 0.2669999897, alpha: 1).setFill()
            path.fill()
        } else if highlight {
            let path = UIBezierPath(rect: rect)
            #colorLiteral(red: 0.7220000029, green: 0.8859999776, blue: 0.5920000076, alpha: 1).setFill()
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
        layer.borderWidth = Constants.lineWidth
        layer.borderColor = UIColor.border.cgColor
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setTitleColor(.text, for: .normal)
    }
    
    
}
