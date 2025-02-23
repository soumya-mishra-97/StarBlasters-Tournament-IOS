//
//  MatchesTableViewCell.swift
//  StarWarsBlastersTournament
//
//  Created by Soumya Ranjan Mishra on 12/07/24.
//

import UIKit

class MatchesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var player1NameLabel: UILabel!
    @IBOutlet weak var player2NameLabel: UILabel!
    @IBOutlet weak var player1ScoreLabel: UILabel!
    @IBOutlet weak var player2ScoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with match: Matches, player1: Player, player2: Player) {
        player1NameLabel.text = player1.name
        player2NameLabel.text = player2.name
        
        let player1ScoreText = "\(match.player1.score != 0 ? match.player1.score : 0)"
        let player2ScoreText = "\(match.player2.score != 0 ? match.player2.score : 0)"
        
        player1ScoreLabel.text = player1ScoreText
        player2ScoreLabel.text = player2ScoreText
    }
}
