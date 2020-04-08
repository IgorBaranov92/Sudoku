import UIKit

class LevelsViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView! { didSet {
        scrollView.delegate = self
        }}
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return stackView
    }
    
    // MARK: - ViewController lifecycle
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scrollView.contentSize = CGSize(width: view.bounds.width,
                                       height: stackView.bounds.height + 25)
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SudokuViewController,let id = segue.identifier {
            switch id {
            case "ClassicSudoku":
                destination.gameType = .classic
                destination.path = "classic"
             case "DiagonalSudoku":
                destination.gameType = .diagonal
                destination.path = "diagonal"
            case "TwoDiagonalsSudoku":
                destination.gameType = .twoDiagonals
                destination.path = "twodiagonals"
            case "RombSudoku":
                destination.gameType = .romb
                destination.path = "romb"
            case "ShapeSudoku":
                destination.gameType = .shape
                destination.path = "shape"
            default:break
            }
        }
    }
    
    @IBAction func done(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    
    
    
    
}
