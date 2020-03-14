import UIKit

class TutorialView: UIView {

    var message = "" { didSet { setNeedsDisplay() }}
    
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect,
                                cornerRadius: Constants.cornerRadiusForTutorialView)
        UIColor.yellow.setFill()
        path.fill()
        
        let label = UILabel(frame: CGRect(origin: CGPoint(x: 10, y: 10), size: CGSize(width: rect.width - 10, height: rect.height/10 - 10)))
        label.textAlignment = .left
        label.text = "Правила"
        addSubview(label)
        
        let textView = UITextView(frame: CGRect(x: 0, y: rect.height/10, width: rect.width, height: rect.height*4/5))
        textView.isEditable = false
        
        addSubview(textView)
        
        let done = DoneButton(type: .custom)
        done.frame = CGRect(x: 10, y: rect.height*9/10, width: rect.width - 20, height: rect.height/10)
        done.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
        addSubview(done)
    }
    
    
    @objc
    private func dismissSelf() {
        TutorialViewAnimator.dismiss(self)
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
