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
        attentionLabel.textColor = .dynamicGreen
        attentionLabel.font = UIFont(name: "Avenir Next", size: 30)
        addSubview(attentionLabel)
        
        let textView = UITextView(frame: CGRect(x: 10, y: rect.height*0.15, width: rect.width - 20, height: rect.height*0.5))
        textView.text = message
        textView.textAlignment = .natural
        textView.backgroundColor = .clear
        textView.font = UIFont(name: "Avenir Next", size: 20)
        textView.isEditable = false
        textView.allowsEditingTextAttributes = false
        textView.isSelectable = false
        addSubview(textView)
        
        let noButtonFrame = CGRect(x: 5, y: rect.height*0.85+5, width: rect.width/2-10, height: rect.height*0.15-10)
        let noButton = NoButton(frame: noButtonFrame)
        noButton.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        addSubview(noButton)
        
        let yesButtonFrame = CGRect(x: rect.width/2 + 5, y: rect.height*0.85+5, width: rect.width/2-10, height: rect.height*0.15-10)
        let yesButton = YesButton(frame: yesButtonFrame)
        yesButton.addTarget(self, action: #selector(erase), for: .touchUpInside)
        addSubview(yesButton)
        
    }
   
    @objc
    func dismiss() {
        ViewAppearanceAnimator.dismiss(self) { [weak self] in
            self?.delegate?.eraseCanceled()
        }
    }
    
    @objc
    func erase () {
        ViewAppearanceAnimator.dismiss(self) { [weak self] in
            self?.delegate?.eraseConfirmed()
        }
    }

}
