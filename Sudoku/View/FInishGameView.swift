import UIKit

class FInishGameView: MessageView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: rect.width, height: 40))
        label.textAlignment = .center
        label.textColor = .systemGreen
        label.font = UIFont(name: "Avenir Next", size: 25)
        label.text = localized("Victory")
        addSubview(label)
        
        let backButton = BackButton(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
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
    
}
