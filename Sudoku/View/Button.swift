import UIKit

class Button: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        if #available(iOS 13.0, *) {
            setTitleColor(Colors.dynamicButtonColor, for: .normal)
        } else {
            setTitleColor(.systemGreen, for: .normal)
        }
    }

}
