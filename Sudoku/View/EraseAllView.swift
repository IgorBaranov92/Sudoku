import UIKit

class EraseAllView: EraseStatisticView {

    var eraseAllDelegate:EraseAllViewDelegate?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }

    override func dismiss() {
        eraseAllDelegate?.eraseAllCanceled()
        ViewAppearanceAnimator.dismiss(self)
    }
    
    override func erase() {
        eraseAllDelegate?.eraseAllConfirmed()
        ViewAppearanceAnimator.dismiss(self)
    }
}
