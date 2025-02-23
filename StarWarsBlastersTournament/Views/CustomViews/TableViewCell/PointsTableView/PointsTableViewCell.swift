//
//  PointsTableViewCell.swift
//  StarWarsBlastersTournament
//
//  Created by Soumya Ranjan Mishra on 12/07/24.
//

import UIKit


class PointsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playerIconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var totalScoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
        
    func configure(with player: Player, totalScore: Int) {
        nameLabel.text = player.name
        totalScoreLabel.text = "\(totalScore)"
        if let url = URL(string: player.icon) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data, error == nil {
                    DispatchQueue.main.async {
                        self.playerIconImageView.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
    }
}
