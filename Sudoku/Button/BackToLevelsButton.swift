import UIKit

class BackToLevelsButton: UIButton {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: Constants.cornerRadiusForNewGameButton)
        UIColor.dynamicBlue.setFill()
        path.fill()
    }

    override init(frame: CGRect) {
           super.init(frame: frame)
           adjust()
       }
       
       required init?(coder: NSCoder) {
           super.init(coder: coder)
           adjust()
       }
       
       private func adjust() {
          setTitle("Назад", for: .normal)
          titleLabel?.font = UIFont(name: "Avenir Next", size: 23)
          setTitleColor(.dynamicBlack, for: .normal)
       }
}
