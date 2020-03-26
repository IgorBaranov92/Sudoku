import UIKit

class LevelsViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView! { didSet {
        scrollView.delegate = self
        }}
    
    
    // MARK: - ViewController lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.flashScrollIndicators()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scrollView.contentSize = CGSize(width: view.bounds.width, height: stackView.bounds.height + 25)        
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SudokuViewController,let id = segue.identifier {
            switch id {
            case "ClassicSudoku":
                destination.gameType = .classic
             case "DiagonalSudoku":
                destination.gameType = .diagonal
            case "TwoDiagonalsSudoku":
                destination.gameType = .twoDiagonals
            case "RombSudoku":
                destination.gameType = .romb
            default:break
            }
        }
    }
    
    @IBAction func done(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
