import UIKit

class ShapeSudokuViewController: SudokuViewController {

    var id = 0

    @IBOutlet weak var shapeView: ShapeView! { didSet {
        shapeView?.id = id
        }}
    
    
    
}
