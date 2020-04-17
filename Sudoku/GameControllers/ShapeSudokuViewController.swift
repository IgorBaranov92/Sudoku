import UIKit

class ShapeSudokuViewController: SudokuViewController {

    var index = 0

    @IBOutlet weak var shapeView: ShapeView! { didSet {
        shapeView?.id = index
        }}
    
    override func viewDidLoad() {
        super.id = index
        super.viewDidLoad()
    }
    
}
