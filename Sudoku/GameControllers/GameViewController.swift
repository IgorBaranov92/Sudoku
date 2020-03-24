import UIKit

class GameViewController: UIViewController {

    
    @IBOutlet weak var mistakesLabel: UILabel!
    @IBOutlet weak var hintsLabel: UILabel!
    
    @IBOutlet weak var offsetConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var labelsStackView:UIStackView!
    @IBOutlet weak var buttonsStackView: UIStackView!
    @IBOutlet weak var digitsStackView: UIStackView!
    
    @IBOutlet weak var stackView: UIStackView!
    
    //constraints for digits
    @IBOutlet private weak var centerXDigitsStackViewConstraint: NSLayoutConstraint!
    @IBOutlet private weak var topAnchorDigitsStackView: NSLayoutConstraint!
    @IBOutlet private weak var leadingAnchorDigitsStackView:NSLayoutConstraint!
    
    //constraint for buttons
    @IBOutlet private weak var centerXButtonsStackViewConstraint: NSLayoutConstraint!
    @IBOutlet private weak var trailingAnchorButtonsStackView: NSLayoutConstraint!
    @IBOutlet private weak var topAnchorButtonsStackView: NSLayoutConstraint!
    
    //constraints for labels
    
    @IBOutlet private weak var centerXLabelsStackViewConstraint: NSLayoutConstraint!
    @IBOutlet private weak var trailingAnchorLabelsStackView: NSLayoutConstraint!
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateConstraints()
    }
    
    private func updateConstraints() {
        offsetConstraint.constant = UIDevice.device == .iPhoneSE ? 0 : 20.0
        if UIDevice.isIpad {
            labelsStackView.axis = UIDevice.isLandscape ? .vertical : .horizontal
            labelsStackView.spacing = UIDevice.isLandscape ? 20.0 : 0.0
            digitsStackView.axis = UIDevice.isLandscape ? .vertical : .horizontal
            buttonsStackView.axis = UIDevice.isLandscape ? .vertical : .horizontal
            centerXDigitsStackViewConstraint.isActive = !UIDevice.isLandscape
            topAnchorDigitsStackView.isActive = UIDevice.isLandscape
            leadingAnchorDigitsStackView.isActive = UIDevice.isLandscape
            leadingAnchorDigitsStackView.constant = 20
            centerXButtonsStackViewConstraint.isActive = !UIDevice.isLandscape
            trailingAnchorButtonsStackView.isActive = UIDevice.isLandscape
            topAnchorButtonsStackView.isActive = UIDevice.isLandscape
            centerXLabelsStackViewConstraint.isActive = !UIDevice.isLandscape
            trailingAnchorLabelsStackView.isActive = UIDevice.isLandscape
        }
    }

}
