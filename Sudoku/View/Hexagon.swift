import UIKit

@IBDesignable
class Hexagon: UIView {

    var paths = [(path:UIBezierPath,color:UIColor )]()
    var id = 1
    
    override func draw(_ rect: CGRect) {
        paths.forEach {
            $0.path.lineWidth = 2.0
            $0.color.setFill()
//            $0.path.fill()
            //#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
            $0.path.stroke()
        }
    }

    
    private func drawTriangleAt(start:CGPoint,reverse:Bool) -> (UIBezierPath,UIColor) {
        let path = UIBezierPath()
        path.move(to: start)
        if reverse {
            path.addLine(to: CGPoint(x: start.x+bounds.width/2, y: start.y))
            path.addLine(to: CGPoint(x: start.x+bounds.width/4, y: start.y+bounds.height/2))
            path.close()
        } else {
            path.addLine(to: CGPoint(x: start.x+bounds.width/4, y: start.y+bounds.height/2))
            path.addLine(to: CGPoint(x: start.x-bounds.width/4, y: start.y+bounds.height/2))
            path.close()
            let label = UILabel(frame: CGRect(x: start.x-10, y: start.y+bounds.height/4, width: 20, height: 20))
            label.numberOfLines = 0
            label.minimumScaleFactor = 0.1
            label.font = UIFont(name: "Helvetica", size: 40)
            label.textAlignment = .center
            label.adjustsFontSizeToFitWidth = true
            label.text = String(Int.random(in: 1...6))
         //   addSubview(label)
        }
        
        return (path,#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(shapeTouchedBy(_:))))
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(shapeTouchedBy(_:))))
        setup()
    }
    
    
    
    private func setup() {
        paths.append(drawTriangleAt(start: CGPoint(x: bounds.width/4, y: 0), reverse: false))
        paths.append(drawTriangleAt(start: CGPoint(x: bounds.width/4, y: 0), reverse: true))
        paths.append(drawTriangleAt(start: CGPoint(x: bounds.width/4*3, y: 0), reverse: false))
        paths.append(drawTriangleAt(start: CGPoint(x: 0, y: bounds.midY), reverse: true))
        paths.append(drawTriangleAt(start: bounds.center, reverse: false))
        paths.append(drawTriangleAt(start: bounds.center, reverse: true))
    }
    
    @objc
    private func shapeTouchedBy(_ recognizer:UITapGestureRecognizer) {
        if recognizer.state == .ended {
            let location = recognizer.location(in: self)
            for index in paths.indices {
                paths[index].color = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
                if paths[index].path.contains(location) {
                    paths[index].color = .red
                }
            }
        }
    }
    
    convenience init(id:Int) {
        self.init(frame:CGRect.zero)
        self.id = id
    }
}

extension CGRect {
    var center:CGPoint {
        CGPoint(x: midX, y: midY)
    }
}
