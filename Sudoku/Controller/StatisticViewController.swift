import UIKit

class StatisticViewController: UIViewController,UITableViewDataSource,UITableViewDelegate, EraseViewDelegate {
    
// MARK: - Model
    
    var statistic = Statistic()
    
// MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView! { didSet {
        tableView.dataSource = self
        tableView.delegate = self
        }}
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var bottomView: UIView!
    
    // MARK: - Private API
    @IBOutlet private weak var heightConstaint: NSLayoutConstraint!
    
    private var currentTitle = "Классика"
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
        eraseView.attentionMessage = "Внимание!"
        eraseView.message = "Вы действительно хотите сбросить всю статистику для режима " + "'" + currentTitle + "'?" + "\n" + "Действие нельзя будет отменить."
        view.addSubview(eraseView)
        EraseViewConstraints.activate(eraseView, view)
        ViewAppearanceAnimator.show(eraseView)
        enableUI(false)
    }
    
    @IBAction func changeStatisticBasedOnGameType(_ sender: UIButton) {
        buttons.forEach { $0.setTitleColor(.dynamicBlack, for: .normal)}
        self.currentTitle = sender.currentTitle ?? " "
        StatisticButtonAnimator.animate(sender)
        if let buttonIndex = buttons.firstIndex(of:sender) {
            sender.setTitleColor(.dynamicGreen, for: .normal)
            index = buttonIndex
            tableView.reloadData()
        }
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
        enableUI(true)
    }
    
    func eraseCanceled() {
        enableUI(true)
    }
    
    private func enableUI(_ yes:Bool) {
        buttons.forEach { $0.isUserInteractionEnabled = yes }
        resetButton.isUserInteractionEnabled = yes
        tableView.backgroundColor = yes ? .background : .backgroundInactive
        tableView.visibleCells.forEach { $0.backgroundColor = yes ? .background : .backgroundInactive }
        tableView.isUserInteractionEnabled = yes
        bottomView.backgroundColor = yes ? .background : .backgroundInactive
    }
   
}
