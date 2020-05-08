import UIKit

@IBDesignable
class LevelChooser: UIView {

    var whiteView = WhiteView()
    
    weak var delegate: NewGameDelegate?
    
    private var viewWidth: CGFloat = 0
    
    override func draw(_ rect: CGRect) {
        print("draw")
        viewWidth = rect.width
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 7)
        #colorLiteral(red: 0.1879999936, green: 0.8199999928, blue: 0.3449999988, alpha: 1).setFill()
        path.fill()

        let firstLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width/3, height: 31))
        firstLabel.text = "⭑"
        configure(firstLabel)
        firstLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(newEasyGame(_:))))
        addSubview(firstLabel)

        let secondLabel = UILabel(frame: CGRect(x: rect.width/3, y: 0, width: rect.width/3,height: 31))
        secondLabel.text = "⭑⭑"
        configure(secondLabel)
        secondLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(newMediumGame(_:))))
        addSubview(secondLabel)

        let thirdLabel = UILabel(frame: CGRect(x: rect.width*2/3, y: 0, width: rect.width/3, height: 31))
        thirdLabel.text = "⭑⭑⭑"
        configure(thirdLabel)
        thirdLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(newHardGame(_:))))
        addSubview(thirdLabel)
        
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: rect.width/3, y: 5))
        linePath.addLine(to: CGPoint(x: rect.width/3, y: 26))
        linePath.move(to: CGPoint(x: rect.width*2/3, y: 5))
        linePath.addLine(to: CGPoint(x: rect.width*2/3, y: 26))
        linePath.lineWidth = 0.25
        UIColor.diagonal.setStroke()
        linePath.stroke()
        
        whiteView.frame = CGRect(x: 0, y: 0, width: rect.width/3, height: 31)
        insertSubview(whiteView, at: 0)
    }

    
    private func configure(_ label:UILabel) {
        label.textAlignment = .center
        label.textColor = .dynamicBlack
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.isUserInteractionEnabled = true
    }
    
    func moveTo(_ level:Int,from current:Int) {
        UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: 0.25,
            delay: 0.0,
            options: .curveLinear,
            animations: {
                self.whiteView.frame.origin.x = self.viewWidth/3*CGFloat(level)
        }) {  if $0 == .end {}
        }
    }
    
    @objc
    private func newEasyGame(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .ended {
            delegate?.createEasyGame()
        }
    }
    
    @objc
    private func newMediumGame(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .ended {
            delegate?.createMediumGame()
        }
    }
    
    
    @objc
    private func newHardGame(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .ended {
            delegate?.createHardGame()
        }
    }
    
}

class WhiteView: UIView {
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect.insetBy(dx: 2.0, dy: 2.0), cornerRadius: 5)
        UIColor.white.setFill()
        path.fill()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .clear
    }
    
}
