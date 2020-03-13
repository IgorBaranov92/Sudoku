import UIKit

class HexagonDeck: UIView {

    var hexagons = [Hexagon]()
    
    override func draw(_ rect: CGRect) {
//        setup()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for index in hexagons.indices {
            hexagons[index].frame = self[index]
            print("index = \(index) frame = \(self[index]) \(hexagons[index].frame)")
        }
        if hexagons.count == 6 {
        print(hexagons[0].frame)
        print(hexagons[1].frame)
        print(hexagons[2].frame)
        print(hexagons[3].frame)
        print(hexagons[4].frame)
        print(hexagons[5].frame)
        }

    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     //   setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
      //  setup()
    }
    
    func addHexagons(_ new:[Hexagon]) {
        hexagons += new
        hexagons.forEach {
            addSubview($0)
            $0.contentMode = .redraw
        }
        layoutIfNeeded()
    }
    
    
    private func setup() {
//        hexagons.forEach { addSubview($0 )}
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
