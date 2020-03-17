import UIKit

class ShapeViewController: SudokuViewController {

    var shapeSudoku = ShapeSudoku()
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        cells.forEach {
            let index = cells.firstIndex(of: $0) ?? 0
            $0.lines = shapeSudoku.lines[index]
        }
    }
    

}
