import UIKit

@IBDesignable
class BackgroundView: UIView {
    
    private let startColor = #colorLiteral(red: 0.1386141571, green: 0.8488830682, blue: 1, alpha: 1)
    private let endColor   = #colorLiteral(red: 0, green: 0.3162082657, blue: 1, alpha: 1) 
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        if let context = context {
            let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(),
                                      colors: [startColor.cgColor, endColor.cgColor] as CFArray,
                                      locations: [0.0,1.0])
            if let gradient = gradient {
                context.drawLinearGradient(gradient,start: CGPoint.zero,end: CGPoint(x:0,y:bounds.height), options: [])
            }
        }
    }
    
}
