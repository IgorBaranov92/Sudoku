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
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((collectionView.bounds.width-31)/2),
                      height:((collectionView.bounds.width-31)/2) + 40)
    }
   
    
}
