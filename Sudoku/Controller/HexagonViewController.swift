import UIKit

class HexagonViewController: UIViewController {

    @IBOutlet weak var deck: HexagonDeck!
    
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        deck.addHexagons([Hexagon(id: 0),Hexagon(id: 1),Hexagon(id: 2),Hexagon(id: 3),Hexagon(id: 4),Hexagon(id: 5)])
    }

}
