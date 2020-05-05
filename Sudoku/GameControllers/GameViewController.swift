import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var spacingConstraint: NSLayoutConstraint!
    @IBOutlet weak var spacingTwoConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var mistakesLabel: UILabel!
    @IBOutlet var digits: [UIButton]!
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        spacingConstraint.constant = UIDevice.device == .iPhoneSE ? 25 : 50
        spacingTwoConstraint.constant = UIDevice.device == .iPhoneSE ? 25 : 50
    }

}
