import UIKit

@IBDesignable
class BackButton: UIButton {

    override func draw(_ rect: CGRect) {
        updateUI()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        updateUI()
    }
    
    private func updateUI() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.width, y: 0))
        path.addLine(to: CGPoint(x: bounds.midX, y: bounds.midY))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        path.lineWidth = 5.0
        UIColor.dynamicBlack.setStroke()
        path.stroke()
    }
    
}
