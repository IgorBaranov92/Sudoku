import UIKit

class TutorialView: MessageView {

    var message = " " { didSet { setNeedsDisplay() }}
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let label = UILabel(frame: CGRect(origin: CGPoint(x: 10, y: 10), size: CGSize(width: rect.width - 10, height: rect.height/10 - 10)))
        label.textAlignment = .center
        label.text = "Правила"
        label.textColor = .systemGreen
        label.font = UIFont(name: "Avenir Next", size: 35)
        addSubview(label)
        
        let textView = UITextView(frame: CGRect(x: 10, y: rect.height/10, width: rect.width - 20, height: rect.height*4/5 - 15))
        textView.text = message
        textView.backgroundColor = .clear
        textView.font = UIFont(name: "Avenir Next", size: 20)
        textView.isEditable = false
        textView.allowsEditingTextAttributes = false
        textView.isSelectable = false
        addSubview(textView)
        
        let done = DoneButton(type: .custom)
        done.frame = CGRect(x: 10, y: rect.height*9/10 - 15, width: rect.width - 20, height: rect.height/10)
        done.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
        addSubview(done)
    }
    
    
    @objc
    private func dismissSelf() {
        ViewAppearanceAnimator.dismiss(self)
    }
    

}
