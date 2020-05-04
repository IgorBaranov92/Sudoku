import UIKit

class DynamicButton: UIButton {

    override func draw(_ rect: CGRect) {
        updateUI()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        updateUI()
    }
    
    private func updateUI() {
        if #available(iOS 13.0, *) {
            setTitleColor(Colors.dynamicButtomColor, for: .normal)
        } else {
            setTitleColor(.black, for: .normal)
        }
    }
    
}
