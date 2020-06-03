import UIKit

class LevelsCollectionViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView! { didSet {
        collectionView.dataSource = self
        collectionView.delegate = self
        }}
    
    private let levels = ["Классика","Диагональ","Две диагонали","Ромб","Октагон","Фигуры"]
    
    private let types: [GameType] = [.classic,.diagonal,.twoDiagonals,.romb,.hexagon,.shape]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return levels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LevelCell", for: indexPath)
        if let levelCell = cell as? LevelSelectionCollectionViewCell {
            levelCell.levelLabel.text = levels[indexPath.item]
            levelCell.levelPreview.id = 0
            levelCell.levelPreview.type = types[indexPath.item]
            return levelCell
        }
        return cell
    }
    
    private var index = 0
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        index = indexPath.item
        switch indexPath.item {
        case 0...4: performSegue(withIdentifier: "Sudoku", sender: self)
        case 5: performSegue(withIdentifier: "ShapeSelection", sender: self)
        default:break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((collectionView.bounds.width-31)/2),
                      height:((collectionView.bounds.width-31)/2) + 40)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier,let gameVC = segue.destination as? SudokuViewController {
            if identifier == "Sudoku" {
                switch index {
                case 0:
                    gameVC.path = "classic"
                    gameVC.gameType = .classic
                case 1:
                gameVC.path = "diagonal"
                gameVC.gameType = .diagonal
                case 2:
                gameVC.path = "twoDiagonals"
                gameVC.gameType = .twoDiagonals
                case 3:
                gameVC.path = "romb"
                gameVC.gameType = .romb
                case 4:
                gameVC.path = "hexagon"
                gameVC.gameType = .hexagon
                default:break
                }
            }
        }
            if let shapeVC = segue.destination as? ShapeSelectionViewController {
                shapeVC.path = "shapes"
                shapeVC.gameType = .shape
            }
    }
    
    @IBAction func done(_ sender:UIButton) {
        dismiss(animated: true)
    }
    
}
