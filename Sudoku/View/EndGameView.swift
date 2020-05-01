
import UIKit

class EndGameView: MessageView {

    var header = " " { didSet { setNeedsDisplay() }}
    
    var body = " " { didSet { setNeedsDisplay() }}
    
    weak var delegate: EndGameDelegate?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let label = ShrinkableLabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: rect.height*0.3))
        label.font = UIFont(name: "Avenir Next", size: 35)
        label.text = body
        label.textColor = #colorLiteral(red: 0.1879999936, green: 0.8199999928, blue: 0.3449999988, alpha: 1)
        label.textAlignment = .center
        addSubview(label)
        
        let newGameButton = NewGameButton(frame: CGRect(x: 10, y: rect.height*0.8, width: rect.width-20, height: rect.height*0.15))
        newGameButton.addTarget(self, action: #selector(newGame), for: .touchUpInside)
        addSubview(newGameButton)
        
        
        
    }
    
    @objc
    private func newGame() {
        delegate?.createNewGame()
        ViewAppearanceAnimator.dismiss(self)
    }

}
