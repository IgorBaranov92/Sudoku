import UIKit

class StatisticViewController: UITableViewController {

    var statistic = Statistic()

    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStatistic()
    }
    

    
    // MARK: - UITableViewDataSourse
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return statistic.scoresFor.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statistic.scoresFor[.classic]?.descriptions.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
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
    
    
    private func updateStatistic() {
        
    }
    
    
    
}
