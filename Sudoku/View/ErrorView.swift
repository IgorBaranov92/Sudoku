import UIKit

class ErrorView: UIView {

    var message = " " { didSet { setNeedsDisplay() }}
    
    var pivot = CGPoint.zero { didSet { setNeedsDisplay() }}
    
    override func draw(_ rect: CGRect) {
        let label = UILabel()
        label.text = message
        label.frame = CGRect(x: 10 , y: 0, width: rect.width - pivot.x, height: rect.height)
        label.sizeToFit()
        label.frame.size.height = rect.height

        if pivot.x  < rect.center.x {
            label.textAlignment = .left
            label.frame.origin.x = max(pivot.x + rect.height*1.5 - label.bounds.width,15)
        } else if pivot.x > rect.center.x {
            label.textAlignment = .right
            label.frame.origin.x = rect.width - label.bounds.width - 15

        } else {
            label.textAlignment = .center
            label.frame.origin.x = rect.width/2 - label.frame.size.width/2
        }
        let path = UIBezierPath(roundedRect: CGRect(x: label.frame.origin.x - 5, y: 0, width: label.frame.width + 10, height: rect.height),
                               cornerRadius: Constants.cornerRadiusForErrorView)
        UIColor.orange.setFill()
        path.fill()
        addSubview(label)
        alpha = 0
        
        let triangleView = TriangleView(frame: CGRect(x: pivot.x-8, y: rect.maxY, width: 16, height: 16))
        addSubview(triangleView)
        
        ErrorViewAnimation.show(self)
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .clear
    }
    
}


