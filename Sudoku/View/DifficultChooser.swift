import UIKit

class DifficultChooser: UISegmentedControl {

    weak var delegate: NewGameDelegate?
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        delegate?.recreateGameIfNeededAt(self.selectedSegmentIndex)
        
    }

}
