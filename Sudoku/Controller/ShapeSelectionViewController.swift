import UIKit


class ShapeSelectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var gameType: GameType = .classic
    var path = String()
    
    @IBOutlet weak var collectionView: UICollectionView! { didSet {
        collectionView.dataSource = self
        collectionView.delegate = self
        }}
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath)
        if let shapeCell = cell as? ShapeCollectionViewCell {
            shapeCell.shapeView.type = .shape
            shapeCell.shapeView.id = indexPath.item
        }
        return cell
    }
 
    // MARK: - Delegation
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((collectionView.bounds.width-31)/2),
                      height:((collectionView.bounds.width-31)/2))
    }
   
// MARK: - Segue

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShapeSudoku",
            let destination = segue.destination as? SudokuViewController,
            let cell = sender as? ShapeCollectionViewCell,
            let index = collectionView.indexPath(for: cell) {
            destination.path = path
            destination.gameType = gameType
            destination.id = index.item
        }
    }
    
    // MARK: - IBACtion
    
    @IBAction func done(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
