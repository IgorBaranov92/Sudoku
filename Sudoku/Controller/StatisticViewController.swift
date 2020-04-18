import UIKit

class StatisticViewController: UIViewController,UITableViewDataSource,UITableViewDelegate, EraseViewDelegate, EraseAllViewDelegate {
    
// MARK: - Model
    
    var statistic = Statistic()
    
// MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView! { didSet {
        tableView.dataSource = self
        tableView.delegate = self
        }}
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet var buttons: [UIButton]! { didSet {
        buttons[0].setTitleColor(.dynamicGreen, for: .normal)
        }}
    @IBOutlet weak var resetAllButton: UIBarButtonItem!
    @IBOutlet weak var resetButton: UIButton!
    
    // MARK: - Private API
    @IBOutlet private weak var heightConstaint: NSLayoutConstraint!
    
    private var currentTitle = "classic"
    private var index = 0
    
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStatistic()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scrollView.contentSize = CGSize(width: stackView.bounds.width,
                                       height: heightConstaint.constant)
    }
    
    // MARK: - UITableViewDataSourse
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Statistic.difficult.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statistic.scores[0].descriptions.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatisticCell", for: indexPath)
        if let statisticCell = cell as? StatisticTableViewCell {
            let scores = statistic.scores[index]
            statisticCell.descriptionLabel.text = scores.descriptions[indexPath.row]
            statisticCell.scoreLabel.text = "\(scores.scores[indexPath.section][indexPath.row])"
            return statisticCell
        }
        return cell
    }

    // MARK: - UITableView delegate
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Statistic.difficult[section]
    }

    
    // MARK: - IBActions
    @IBAction func done(_ sender:UIBarButtonItem) {
         dismiss(animated: true)
     }
     
    
    @IBAction func resetAll(_ sender: UIButton) {
        let eraseView = EraseStatisticView()
        eraseView.delegate = self
        eraseView.attentionMessage = localized("erareAttention")
        eraseView.message = localized("eraseQuestion") + "'" + localized(currentTitle) + "'?" + "\n" + localized("eraseDescription")
        view.addSubview(eraseView)
        EraseViewConstraints.activate(eraseView, view)
        TutorialViewAnimator.show(eraseView)
        buttons.forEach { $0.isUserInteractionEnabled = false }
        resetAllButton.isEnabled = false
        resetButton.isUserInteractionEnabled = false
    }
    
    @IBAction func changeStatisticBasedOnGameType(_ sender: UIButton) {
        buttons.forEach { $0.setTitleColor(.text, for: .normal)}
        self.currentTitle = sender.currentTitle ?? " "
        StatisticButtonAnimator.animate(sender)
        if let buttonIndex = buttons.firstIndex(of:sender) {
            sender.setTitleColor(.dynamicGreen, for: .normal)
            index = buttonIndex
            tableView.reloadData()
        }
    }
    
    @IBAction func eraseAll(_ sender:UIBarButtonItem) {
        let eraseView = EraseAllView()
        eraseView.eraseAllDelegate = self
        eraseView.attentionMessage = "Внимание!"
        eraseView.message = "Вы действительно хотите удалить всю статистику?\nДействие нельзя будет отменить."
        view.addSubview(eraseView)
        EraseViewConstraints.activate(eraseView, view)
        TutorialViewAnimator.show(eraseView)
        buttons.forEach { $0.isUserInteractionEnabled = false }
        resetAllButton.isEnabled = false
        resetButton.isUserInteractionEnabled = false
    }
    
    
    private func updateStatistic() {
        if let validUrl = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("statistic"),let data = try? Data(contentsOf: validUrl),let newValue = Statistic(json: data) {
            statistic = newValue
            saveStatistic()
            tableView.reloadData()
        }
    }
    
    private func saveStatistic() {
        if let validUrl = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("statistic"),let json = statistic.json {
            try? json.write(to: validUrl)
        }
    }
    
    // MARK: - Protocol conformance

       
    func eraseConfirmed() {
        statistic.scores[index] = Statistic.Scores()
        saveStatistic()
        tableView.reloadData()
        buttons.forEach { $0.isUserInteractionEnabled = true }
        resetAllButton.isEnabled = true
        resetButton.isUserInteractionEnabled = true
    }
    
    func eraseCanceled() {
        buttons.forEach { $0.isUserInteractionEnabled = true }
        resetAllButton.isEnabled = true
        resetButton.isUserInteractionEnabled = true
    }
    
    func eraseAllCanceled() {
        buttons.forEach { $0.isUserInteractionEnabled = true }
        resetAllButton.isEnabled = true
        resetButton.isUserInteractionEnabled = true
    }
    
    func eraseAllConfirmed() {
        for index in statistic.scores.indices {
            statistic.scores[index] = Statistic.Scores()
        }
        saveStatistic()
        tableView.reloadData()
        buttons.forEach { $0.isUserInteractionEnabled = true }
        resetAllButton.isEnabled = true
        resetButton.isUserInteractionEnabled = true
    }
   
}
