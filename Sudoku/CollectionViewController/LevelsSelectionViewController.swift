import UIKit


class LevelsSelectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    
    @IBOutlet weak var collectionView: UICollectionView! { didSet {
    collectionView.dataSource = self
    collectionView.delegate = self
    }}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Classic")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Diagonal")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "TwoDiagonals")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Romb")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
   }

   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        switch indexPath.item {
            case 0:
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Classic", for: indexPath)
            case 1:
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Diagonal", for: indexPath)
            case 2:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TwoDiagonals", for: indexPath)
            case 3:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Romb", for: indexPath)
            default:break
        }
       return cell
   }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: ((collectionView.bounds.width-31)/2),
                      height:((collectionView.bounds.width-31)/2) + 40)
    }
    

}
