
import UIKit

class EndGameView: MessageView {

    var header = " " { didSet { setNeedsDisplay() }}
    
    var body = " " { didSet { setNeedsDisplay() }}
    
    weak var delegate: EndGameDelegate?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let label = ShrinkableLabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: rect.height*0.2))
        label.font = UIFont(name: "Avenir Next", size: 35)
        label.text = header
        label.textColor = .dynamicGreen
        label.textAlignment = .center
        addSubview(label)
        
        let textView = UITextView(frame: CGRect(x: 0, y: rect.height*0.2, width: rect.width, height: rect.height*0.3))
        textView.font = UIFont(name: "Avenir Next", size: 20)
        textView.text = body
        textView.textColor = .dynamicBlack
        textView.textAlignment = .center
        textView.isEditable = false
        textView.allowsEditingTextAttributes = false
        textView.isSelectable = false
        textView.backgroundColor = .clear
        addSubview(textView)
        
        let backButton = BackToLevelsButton(frame: CGRect(x: 10, y: rect.height*0.6, width: rect.width-20, height: rect.height*0.15))
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        addSubview(backButton)
        
        let newGameButton = NewGameButton(frame: CGRect(x: 10, y: rect.height*0.8, width: rect.width-20, height: rect.height*0.15))
        newGameButton.addTarget(self, action: #selector(newGame), for: .touchUpInside)
        addSubview(newGameButton)
        
        
        
    }
    
    @objc
    private func newGame() {
        ViewAppearanceAnimator.dismiss(self) { [weak self] in
            self?.delegate?.createNewGame()
        }
    }
    @objc
    private func back() {
        delegate?.returnToLevels()
    }

}
