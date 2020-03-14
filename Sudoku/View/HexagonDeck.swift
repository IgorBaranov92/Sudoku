import UIKit

class HexagonDeck: UIView {
    
    @IBOutlet var hexagons: [Hexagon]!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for index in hexagons.indices {
            hexagons[index].frame = self[index]
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
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(shapeTouchedBy(_:))))
    }
    
    @objc
    private func shapeTouchedBy(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .ended {
            let location = recognizer.location(in: self)
            for index in frames.indices {
                if frames[index].contains(location) {
                    print("index = \(index)")
                }
            }
        }
    }
    
    private var hexagonSize: CGSize {
        return CGSize(width: bounds.width/3, height: bounds.height/3)
    }

    private subscript(_ i:Int) -> CGRect {
        return frames[i]
    }
    
    private var frames: [CGRect] {
        return [CGRect(origin: CGPoint(x: 1/6*bounds.width, y: 0), size: hexagonSize),
        CGRect(origin: CGPoint(x: 1/2*bounds.width, y: 0), size: hexagonSize),
        CGRect(origin: CGPoint(x: 0, y: 1/3*bounds.height), size: hexagonSize),
        CGRect(origin: CGPoint(x: 2/3*bounds.width, y: 1/3*bounds.height), size: hexagonSize),
        CGRect(origin: CGPoint(x: 1/6*bounds.width, y: 2/3*bounds.height), size: hexagonSize),
        CGRect(origin: CGPoint(x: 1/2*bounds.width, y: 2/3*bounds.height), size: hexagonSize)]
    }
    
    
}
