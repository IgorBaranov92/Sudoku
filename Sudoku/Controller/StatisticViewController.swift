import UIKit

class StatisticViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
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
    
    
    @IBOutlet private weak var heightConstaint: NSLayoutConstraint!
    
    
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
        return statistic.scoresFor.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statistic.scoresFor[.classic]?.descriptions.count ?? 0
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatisticCell", for: indexPath)
        if let statisticCell = cell as? StatisticTableViewCell {
            let gameType = statistic.gameTypes[indexPath.section]
            if let scores = statistic.scoresFor[gameType] {
                statisticCell.descriptionLabel.text = scores.descriptions[indexPath.row]
                statisticCell.scoreLabel.text = "\(scores.scores[indexPath.row])"
            }
            return statisticCell
        }
        

        return cell
    }
    
    
    // MARK: - UITableView delegate
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return localized(statistic.gameTypes[section].rawValue)
    }

    
    // MARK: - IBActions
    @IBAction func done(_ sender:UIBarButtonItem) {
         dismiss(animated: true)
     }
     
    @IBAction func resetAll(_ sender: UIButton) {
        let alert = UIAlertController(title: localized("Attention"), message: localized("ResetAllWarning"), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: localized("no"), style: .cancel))
        alert.addAction(UIAlertAction(title: localized("yes"), style: .destructive, handler: { action in
            if let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("statistic"), let json = self.statistic.json {
                    self.statistic = Statistic()
                    try? json.write(to: url)
                self.tableView.reloadData()
            }
        }))
        present(alert, animated: true)
    }
    
    @IBAction func changeStatisticBasedOnGameType(_ sender: UIButton) {
        buttons.forEach { $0.setTitleColor(.text, for: .normal)}
        if let index = buttons.firstIndex(of:sender) {
            sender.setTitleColor(.red, for: .normal)
            print(index)
        }
    }
    
    private func updateStatistic() {
        
    }
    
    
    
}
