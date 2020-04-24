import UIKit

class FinishGameView: MessageView {

    weak var delegate: MessageViewDelegate?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 40))
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.1879999936, green: 0.8199999928, blue: 0.3449999988, alpha: 1)
        label.font = UIFont(name: "Avenir Next", size: 25)
        label.text = "Победа"
        addSubview(label)
        
        let backButton = BackButton(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        backButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        addSubview(backButton)
        
        let imageView = UIImageView(frame: CGRect(x: 40, y: 85, width: rect.width - 80, height: rect.width - 80))
        imageView.image = UIImage(named: "Cup")
        addSubview(imageView)
        
        let doneButton = DoneButton(frame: CGRect(x: 10, y: rect.height - 60, width: rect.width - 20, height: 50))
        doneButton.addTarget(self, action: #selector(doneAction), for: .touchUpInside)
        addSubview(doneButton)
        
        
    }

    @objc
    private func doneAction() {
        TutorialViewAnimator.dismiss(self)
    }
    
    @objc
    private func cancel(){
        delegate?.cancelButtonTouched()
    }
    
}

protocol MessageViewDelegate: class {
    func cancelButtonTouched()
}
