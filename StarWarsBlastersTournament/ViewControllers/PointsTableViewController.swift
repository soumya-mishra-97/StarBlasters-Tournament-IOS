//
//  PointsTableViewController.swift
//  StarWarsBlastersTournament
//
//  Created by Soumya Ranjan Mishra on 11/07/24.
//

import UIKit
import UIKit

class PointsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = PointsTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUIProperties()
    }
    
    
    func updateUIProperties() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PointsTableViewCell", bundle: nil), forCellReuseIdentifier: "PointsTableCell")
        fetchData()
    }
    
    private func fetchData() {
        viewModel.fetchTournamentData { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension PointsTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pointsTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PointsTableCell", for: indexPath) as? PointsTableViewCell else {
            return UITableViewCell()
        }
        let entry = viewModel.pointsTable[indexPath.row]
        cell.configure(with: entry.player, totalScore: entry.totalScore)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedEntry = viewModel.pointsTable[indexPath.row]
        let matchesVC = MatchesViewController(nibName: "MatchesViewController", bundle: nil)
        matchesVC.playerName = selectedEntry.player.name
        matchesVC.selectedPlayerID = selectedEntry.player.id
        self.navigationController?.pushViewController(matchesVC, animated: true)
    }
}
