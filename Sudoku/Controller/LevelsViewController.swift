import UIKit

class LevelsViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView! { didSet {
        scrollView.delegate = self
        }}
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scrollView.contentSize = CGSize(width: view.bounds.width, height: stackView.bounds.height + 25)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return stackView
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    @IBAction func done(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
