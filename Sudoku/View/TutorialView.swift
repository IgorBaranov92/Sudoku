import UIKit

class TutorialView: UIView {

//    var message = "" { didSet { setNeedsDisplay() }}
    
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect,
                                cornerRadius: Constants.cornerRadiusForTutorialView)
        UIColor.white.setFill()
        path.fill()
        layer.cornerRadius = Constants.cornerRadiusForTutorialView
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2.0
        let label = UILabel(frame: CGRect(origin: CGPoint(x: 10, y: 10), size: CGSize(width: rect.width - 10, height: rect.height/10 - 10)))
        label.textAlignment = .center
        label.text = NSLocalizedString("rules", comment: "")
        label.textColor = .systemGreen
        label.font = UIFont(name: "Avenir Next", size: 35)
        addSubview(label)
        
        let textView = UITextView(frame: CGRect(x: 10, y: rect.height/10, width: rect.width - 20, height: rect.height*4/5 - 15))
        textView.text = NSLocalizedString("classicMessage", comment: "")
        textView.font = UIFont(name: "Avenir Next", size: 20)
        textView.isEditable = false
        
        addSubview(textView)
        
        let done = DoneButton(type: .custom)
        done.frame = CGRect(x: 10, y: rect.height*9/10 - 15, width: rect.width - 20, height: rect.height/10)
        done.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
        addSubview(done)
    }
    
    
    @objc
    private func dismissSelf() {
        TutorialViewAnimator.dismiss(self)
    }
    

}
