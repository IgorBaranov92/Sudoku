import UIKit

class OptionsViewController: UITableViewController {

    var options = Options()
    
    @IBOutlet var labels: [UILabel]!
    
    @IBOutlet var switches: [UISwitch]!
        
    @IBOutlet private weak var offsetConstraint: NSLayoutConstraint!
    
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    
    // MARK: - IBActions
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        let index = switches.firstIndex(of: sender) ?? 0
        update(sender.isOn,options.identity[index], labels[index],index)
        if sender == switches[0] { //mistakes limit switch
            switches[1].isOn = sender.isOn
            switches[1].isUserInteractionEnabled = !sender.isOn
            switches[1].alpha = sender.isOn ? 0.5 : 1.0
            update(switches[1].isOn, options.identity[1], labels[1], 1)
        }
    }
    
    func update(_ isOn: Bool,_ key:String,_ label:UILabel,_ index:Int) {
        options.options[index] = isOn
        options.descriptions[index] = isOn ? key : "no" + key
        label.text = localized(options.descriptions[index])
        saveOptions()
    }
    
    @IBAction func done(_ sender:UIBarButtonItem) {
        dismiss(animated: true)
    }
 
    
    private func saveOptions() {
        if let validUrl = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("options"),let json = options.json {
            try? json.write(to: validUrl)
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    
    private func updateUI() {
        if let validUrl = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("options"),let data = try? Data(contentsOf: validUrl),let newValue = Options(json: data) {
            options = newValue
            switches.forEach {
                let index = switches.firstIndex(of: $0) ?? 0
                $0.isOn = options.options[index]
            }
            labels.forEach {
                let index = labels.firstIndex(of: $0) ?? 0
                $0.text = localized(options.descriptions[index])
            }
            saveOptions()
        } else { // first time
            labels.forEach {
                let index = labels.firstIndex(of: $0) ?? 0
                $0.text = localized(options.descriptions[index])
            }
        }
        switches[1].isUserInteractionEnabled = !switches[0].isOn
        switches[1].alpha = switches[0].isOn ? 0.5 : 1.0
    }
    
    // MARK: - UItableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == IndexPath(row: 1, section: 0) { return calculateHeightFor(labels[0])}
        if indexPath == IndexPath(row: 3, section: 0) { return calculateHeightFor(labels[1])}
        if indexPath == IndexPath(row: 5, section: 0) { return calculateHeightFor(labels[2])}
        if indexPath == IndexPath(row: 7, section: 0) { return calculateHeightFor(labels[3])}
        if indexPath == IndexPath(row: 9, section: 0) { return calculateHeightFor(labels[4])}
        return 50.0
    }
    
    
    private func calculateHeightFor(_ label: UILabel) -> CGFloat {
        let sized = label.sizeThatFits(CGSize(width: view.bounds.width - offsetConstraint.constant*2, height: 300))
        return sized.height + 10.0
    }
        
}
