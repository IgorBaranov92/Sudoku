import UIKit

class LevelsCollectionViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView! { didSet {
        collectionView.dataSource = self
        collectionView.delegate = self
        }}
    
    private let levels = ["Классика","Диагональ","Две диагонали","Ромб","Октагон","Фигуры"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return levels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LevelCell", for: indexPath)
        if let levelCell = cell as? LevelSelectionCollectionViewCell {
            levelCell.levelLabel.text = levels[indexPath.item]
            levelCell.levelPreview.id = indexPath.item
            return levelCell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0: performSegue(withIdentifier: "ClassicSudoku", sender: self)
        case 1: performSegue(withIdentifier: "DiagonalSudoku", sender: self)
        case 2: performSegue(withIdentifier: "TwoDiagonals", sender: self)
        case 3: performSegue(withIdentifier: "RombSudoku", sender: self)
        case 4: performSegue(withIdentifier: "HexagonSudoku", sender: self)
        case 5: performSegue(withIdentifier: "ShapeSelection", sender: self)
        default:break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((collectionView.bounds.width-31)/2),
                      height:((collectionView.bounds.width-31)/2) + 40)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if let gameVC = segue.destination as? SudokuViewController {
                switch identifier {
                case "ClassicSudoku":
                    gameVC.gameType = .classic
                    gameVC.path = "classic"
                case "DiagonalSudoku":
                gameVC.gameType = .diagonal
                gameVC.path = "diagonal"
                case "TwoDiagonals":
                gameVC.gameType = .twoDiagonals
                gameVC.path = "twoDiagonals"
                case "RombSudoku":
                gameVC.gameType = .romb
                gameVC.path = "romb"
                case "HexagonSudoku":
                gameVC.gameType = .hexagon
                gameVC.path = "hexagon"
                default:break
                }
            }
            if let shapeVC = segue.destination as? ShapeSelectionViewController {
                shapeVC.path = "shapes"
                shapeVC.gameType = .shape
            }
        }
    }
    
    @IBAction func done(_ sender:UIButton) {
        dismiss(animated: true)
    }
    
}
