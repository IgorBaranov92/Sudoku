import UIKit

class OptionsViewController: UITableViewController {

    var options = Options()
    
    @IBOutlet weak var mistakesLimitSwitch: UISwitch!
    @IBOutlet weak var checkMistakesSwitch: UISwitch!
    @IBOutlet weak var areaSelectionSwitch: UISwitch!
    @IBOutlet weak var hideDigitsSwitch:    UISwitch!
    
    @IBOutlet weak var mistakesLimitLabel: UILabel!
    @IBOutlet weak var mistakesCheckLabel: UILabel!
    @IBOutlet weak var areaSelectionLabel: UILabel!
    @IBOutlet weak var hideDigitsLabel: UILabel!

    
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    
    // MARK: - IBActions
    
    @IBAction func changeMistakesLimitSwitch(_ sender: UISwitch) {
        options.options[Keys.mistakesLimit] = sender.isOn
        options.descriptions[Keys.mistakesLimit] = sender.isOn ? localized("mistakesLimit") : localized("noMistakesLimit")
        mistakesLimitLabel.text = options.descriptions[Keys.mistakesLimit] ?? " "
        saveOptions()
    }
    
    @IBAction func changeCheckMistakesSwitch(_ sender: UISwitch) {
        options.options[Keys.mistakesCheck] = sender.isOn
        options.descriptions[Keys.mistakesCheck] = sender.isOn ? localized("mistakesCheck") : localized("noMistakesCheck")
        mistakesCheckLabel.text = options.descriptions[Keys.mistakesCheck] ?? " "
        saveOptions()
    }
    
    @IBAction func changeAreaSelectionSwitch(_ sender: UISwitch) {
        options.options[Keys.areaSelection] = sender.isOn
        options.descriptions[Keys.areaSelection] = sender.isOn ? localized("areaSelection") : localized("noAreaSelection")
        areaSelectionLabel.text = options.descriptions[Keys.areaSelection] ?? " "
        saveOptions()
    }
    
    @IBAction func changeHideDigitsSwitch(_ sender: UISwitch) {
        options.options[Keys.hideDigits] = sender.isOn
        options.descriptions[Keys.hideDigits] = sender.isOn ? localized("hideDigits") : localized("noHideDigits")
        hideDigitsLabel.text = options.descriptions[Keys.hideDigits] ?? " "
        saveOptions()
    }
    
    
    @IBAction func done(_ sender:UIBarButtonItem) {
        dismiss(animated: true)
    }
 
    
    private func saveOptions() {
        if let validUrl = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("options"),let json = options.json {
            try? json.write(to: validUrl)
        }
    }
    
    
    private func updateUI() {
        if let validUrl = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("options"),let data = try? Data(contentsOf: validUrl),let newValue = Options(json: data) {
            options = newValue
            mistakesLimitSwitch.isOn = options.options[Keys.mistakesLimit] ?? true
            checkMistakesSwitch.isOn = options.options[Keys.mistakesCheck] ?? true
            areaSelectionSwitch.isOn = options.options[Keys.areaSelection] ?? true
            hideDigitsSwitch.isOn = options.options[Keys.hideDigits] ?? true
            mistakesLimitLabel.text = options.descriptions[Keys.mistakesLimit] ?? " "
            mistakesCheckLabel.text = options.descriptions[Keys.mistakesCheck] ?? " "
            areaSelectionLabel.text = options.descriptions[Keys.areaSelection] ?? " "
            hideDigitsLabel.text = options.descriptions[Keys.hideDigits] ?? " "
            saveOptions()
        } else { // first time
            mistakesLimitLabel.text = localized("mistakesLimit")
            mistakesCheckLabel.text = localized("mistakesCheck")
            areaSelectionLabel.text = localized("areaSelection")
            hideDigitsLabel.text = localized("hideDigits")
        }
    }
    
    
}
