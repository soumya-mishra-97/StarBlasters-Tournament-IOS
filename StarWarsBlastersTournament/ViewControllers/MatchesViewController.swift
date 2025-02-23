//
//  MatchesViewController.swift
//  StarWarsBlastersTournament
//
//  Created by Soumya Ranjan Mishra on 11/07/24.
//

import UIKit

class MatchesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var playerName: String?
    var selectedPlayerID: Int?
    
    var viewModel = MatchesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUIProperties()
    }
    
    func updateUIProperties() {
        self.navigationItem.title = playerName
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MatchesTableViewCell", bundle: nil), forCellReuseIdentifier: "MatchesTableCell")
        fetchData()
    }
    
    private func fetchData() {
        viewModel.selectedPlayerID = selectedPlayerID 
        viewModel.fetchPlayers { [weak self] in
            self?.viewModel.fetchMatches {
                self?.tableView.reloadData()
            }
        }
    }
}

extension MatchesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MatchesTableCell", for: indexPath) as? MatchesTableViewCell else {
            return UITableViewCell()
        }
        
        let match = viewModel.matches[indexPath.row]
        guard let player1 = viewModel.player(for: match.player1.id),
              let player2 = viewModel.player(for: match.player2.id) else {
            return cell
        }
        
        cell.configure(with: match, player1: player1, player2: player2)
        let outcome = viewModel.matchOutcome(for: match)
        cell.backgroundColor = outcome.color
        
        return cell
    }
}
