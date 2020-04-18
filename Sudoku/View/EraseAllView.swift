import UIKit

class EraseAllView: EraseStatisticView {

    var eraseAllDelegate:EraseAllViewDelegate?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }

    override func dismiss() {
        eraseAllDelegate?.eraseAllCanceled()
        TutorialViewAnimator.dismiss(self)
    }
    
    override func erase() {
        eraseAllDelegate?.eraseAllConfirmed()
        TutorialViewAnimator.dismiss(self)
    }
}
