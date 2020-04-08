import UIKit

class GameViewController: UIViewController {

    
    @IBOutlet weak var mistakesLabel: UILabel!
    @IBOutlet weak var hintsLabel: UILabel!

    @IBOutlet weak var difficultChooser: UISegmentedControl!
    
    @IBOutlet weak var offsetConstraint: NSLayoutConstraint!
    @IBOutlet weak var stackView: UIStackView!


    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateConstraints()
    }
    
    private func updateConstraints() {
        offsetConstraint.constant = UIDevice.device == .iPhoneSE ? 0 : 20.0
    }

}
