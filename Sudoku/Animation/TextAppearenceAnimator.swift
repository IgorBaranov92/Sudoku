import UIKit

class TextAppearenceAnimator {

    class func show(_ cell:Cell,string:String) {
        UIView.transition(with: cell,
                          duration: Constants.durationForTextAppearing,
                          options: .transitionCrossDissolve,
                          animations: {
                            cell.setTitle(string, for: .normal)
        })
    }
    
    class func dismiss(_ cell:Cell) {
        UIView.transition(with: cell,
                          duration: Constants.durationForTextDisappearing,
                          options: .transitionCrossDissolve,
                          animations: {
                            cell.setTitle("", for: .normal)
        })
    }
    
}
