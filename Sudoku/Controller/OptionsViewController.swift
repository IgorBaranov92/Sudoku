import UIKit

class OptionsViewController: UITableViewController {

    var options = Options()
    
    @IBOutlet weak var mistakesLimitSwitch: UISwitch!
    @IBOutlet weak var checkMistakesSwitch: UISwitch!
    @IBOutlet weak var areaSelectionSwitch: UISwitch!
    @IBOutlet weak var hideDigitsSwitch: UISwitch!
    @IBOutlet weak var timerSwitch: UISwitch!
    
    @IBOutlet weak var mistakesLimitLabel: UILabel!
    @IBOutlet weak var mistakesCheckLabel: UILabel!
    @IBOutlet weak var areaSelectionLabel: UILabel!
    @IBOutlet weak var hideDigitsLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet private weak var offsetConstraint: NSLayoutConstraint!
    
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }


    
    // MARK: - IBActions
    
    @IBAction func changeMistakesLimitSwitch(_ sender: UISwitch) {
        update(sender.isOn, key: Keys.mistakesLimit, label: mistakesLimitLabel)
        checkMistakesSwitch.isOn = sender.isOn
        checkMistakesSwitch.isUserInteractionEnabled = !sender.isOn
        checkMistakesSwitch.alpha = sender.isOn ? 0.5 : 1.0
        update(checkMistakesSwitch.isOn, key: Keys.mistakesCheck, label: mistakesCheckLabel)
    }
    
    @IBAction func changeCheckMistakesSwitch(_ sender: UISwitch) {
        update(sender.isOn, key: Keys.mistakesCheck, label: mistakesCheckLabel)

    }
    
    @IBAction func changeAreaSelectionSwitch(_ sender: UISwitch) {
        update(sender.isOn, key: Keys.areaSelection, label: areaSelectionLabel)

    }
    
    @IBAction func changeHideDigitsSwitch(_ sender: UISwitch) {
        update(sender.isOn, key: Keys.hideDigits, label: hideDigitsLabel)

    }
    
    @IBAction func changeTimerSwitch(_ sender: UISwitch) {
        update(sender.isOn, key: Keys.timer, label: timerLabel)
    }
    
    func update(_ isOn: Bool,key:String,label:UILabel) {
        options.options[key] = isOn
        options.descriptions[key] = isOn ? key : "no" + key
        label.text = localized(options.descriptions[key] ?? " ")
        saveOptions()
    }
    
    @IBAction func done(_ sender:UIBarButtonItem) {
        dismiss(animated: true)
    }
 
    
    private func saveOptions() {
        if let validUrl = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("options"),let json = options.json {
            try? json.write(to: validUrl)
            tableView.reloadData()
        }
    }
    
    
    private func updateUI() {
        if let validUrl = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("options"),let data = try? Data(contentsOf: validUrl),let newValue = Options(json: data) {
            options = newValue
            mistakesLimitSwitch.isOn = options.options[Keys.mistakesLimit] ?? true
            checkMistakesSwitch.isOn = options.options[Keys.mistakesCheck] ?? true
            areaSelectionSwitch.isOn = options.options[Keys.areaSelection] ?? true
            hideDigitsSwitch.isOn = options.options[Keys.hideDigits] ?? true
            timerSwitch.isOn = options.options[Keys.timer] ?? true
            checkMistakesSwitch.isUserInteractionEnabled = !mistakesLimitSwitch.isOn
            checkMistakesSwitch.alpha = mistakesLimitSwitch.isOn ? 0.5 : 1.0
        mistakesLimitLabel.text = localized(options.descriptions[Keys.mistakesLimit] ?? " ")
        mistakesCheckLabel.text = localized(options.descriptions[Keys.mistakesCheck] ?? " ")
        areaSelectionLabel.text = localized(options.descriptions[Keys.areaSelection] ?? " ")
        hideDigitsLabel.text = localized(options.descriptions[Keys.hideDigits] ?? " ")
        timerLabel.text = localized(options.descriptions[Keys.timer] ?? " ")
            saveOptions()
        } else { // first time
            mistakesLimitLabel.text = localized(Keys.mistakesLimit)
            mistakesCheckLabel.text = localized(Keys.mistakesCheck)
            areaSelectionLabel.text = localized(Keys.areaSelection)
            hideDigitsLabel.text = localized(Keys.hideDigits)
            timerLabel.text = localized("no" + Keys.timer)
        }
    }
    
    // MARK: - UItableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 { return calculateHeightFor(mistakesLimitLabel)}
        if indexPath.row == 3 { return calculateHeightFor(mistakesCheckLabel)}
        if indexPath.row == 5 { return calculateHeightFor(areaSelectionLabel)}
        if indexPath.row == 7 { return calculateHeightFor(hideDigitsLabel)}
        if indexPath.row == 9 { return calculateHeightFor(timerLabel)}

        return 50.0
    }
    
    private func calculateHeightFor(_ label: UILabel) -> CGFloat {
        let sized = label.sizeThatFits(CGSize(width: view.bounds.width - offsetConstraint.constant*2, height: 200))
        return sized.height + 10.0
    }
        
}
