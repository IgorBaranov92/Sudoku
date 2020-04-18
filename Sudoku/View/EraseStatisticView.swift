import UIKit

class EraseStatisticView: InfoView {

    var attentionMessage = " " { didSet { setNeedsDisplay()}}
    
    var message = " " { didSet { setNeedsDisplay()}}
    
    weak var delegate: EraseViewDelegate?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let attentionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 0.15*rect.height))
        attentionLabel.textAlignment = .center
        attentionLabel.text = attentionMessage
        attentionLabel.textColor = .systemGreen
        attentionLabel.font = UIFont(name: "Avenir Next", size: 30)
        addSubview(attentionLabel)
        
        let textView = UITextView(frame: CGRect(x: 10, y: rect.height*0.15, width: rect.width - 20, height: rect.height*0.5))
        textView.text = message
        textView.textAlignment = .natural
        textView.backgroundColor = .clear
        textView.font = UIFont(name: "Avenir Next", size: 15)
        textView.isEditable = false
        textView.allowsEditingTextAttributes = false
        textView.isSelectable = false
        addSubview(textView)
        
        let noButtonFrame = CGRect(x: 5, y: rect.height*0.8+5, width: rect.width/2-10, height: rect.height*0.2-10)
        let noButton = NoButton(frame: noButtonFrame)
        noButton.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        addSubview(noButton)
        
        let yesButtonFrame = CGRect(x: rect.width/2 + 5, y: rect.height*0.8+5, width: rect.width/2-10, height: rect.height*0.2-10)
        let yesButton = YesButton(frame: yesButtonFrame)
        yesButton.addTarget(self, action: #selector(erase), for: .touchUpInside)
        addSubview(yesButton)
        
    }
   
    @objc
    func dismiss() {
        delegate?.eraseCanceled()
        TutorialViewAnimator.dismiss(self)
    }
    
    @objc
    func erase () {
        delegate?.eraseConfirmed()
        TutorialViewAnimator.dismiss(self)
    }

}
