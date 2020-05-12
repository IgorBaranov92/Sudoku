import UIKit

class EraseAllView: EraseStatisticView {

    var eraseAllDelegate:EraseAllViewDelegate?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }

    override func dismiss() {
        ViewAppearanceAnimator.dismiss(self) { [weak self] in
            self?.eraseAllDelegate?.eraseAllCanceled()
        }
    }
    
    override func erase() {
        ViewAppearanceAnimator.dismiss(self) { [weak self] in
            self?.eraseAllDelegate?.eraseAllConfirmed()
        }
    }
}
