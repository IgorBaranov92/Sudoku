import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    weak var timer: Timer!
    private var seconds = 0
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc
    func update() {
        seconds += 1
        label.text = TimeCounter.getTime(seconds)
    }

}
