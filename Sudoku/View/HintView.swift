import UIKit

@IBDesignable
class HintView: UIView {

    var hintsCount = 4 { didSet { setNeedsDisplay()}}
    
    private var label = UILabel()
    
    override func draw(_ rect: CGRect) {
        label.removeFromSuperview()
        let label = UILabel(frame: CGRect(x: rect.width*5/8, y: 1/8*rect.height, width: 1/4*rect.width, height: 1/4*rect.height))
        label.text = String(hintsCount)
        label.font = UIFont(name: "Avenir Next", size: 15)
        label.textAlignment = .center
        addSubview(label)
        let path = UIBezierPath(arcCenter: CGPoint(x: 3/4*rect.width, y: 1/4*rect.height), radius: 1/8*rect.width, startAngle: 0, endAngle: .pi*2, clockwise: false)
//        UIColor(named:"DynamicGreenColor")!.setFill()
        #colorLiteral(red: 0.1879999936, green: 0.8199999928, blue: 0.3449999988, alpha: 1).setFill()
        path.fill()
    }

    
}
