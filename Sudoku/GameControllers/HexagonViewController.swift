import UIKit

class HexagonViewController: UIViewController {

    @IBOutlet weak var deck: HexagonDeck!
    
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let tutorialView = TutorialView(frame: CGRect(x: 30, y: 30, width: 250, height: 500))
        view.insertSubview(tutorialView, at: view.subviews.count)
        TutorialViewAnimator.show(tutorialView)
    }

}
