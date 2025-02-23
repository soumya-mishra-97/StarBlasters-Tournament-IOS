//
//  MatchesViewModel.swift
//  StarWarsBlastersTournament
//
//  Created by Soumya Ranjan Mishra on 12/07/24.
//

import Foundation
import UIKit

class MatchesViewModel {
    var matches: [Matches] = []
    var selectedPlayerID: Int?
    var players: [Player] = []

    func fetchMatches(completion: @escaping () -> Void) {
        guard let playerID = selectedPlayerID else { return }

        NetworkManager.shared.fetchMatches { result in
            switch result {
            case .success(let matches):
                self.matches = matches.filter { $0.player1.id == playerID || $0.player2.id == playerID }
                completion()
            case .failure(let error):
                print("Error fetching matches: \(error)")
                completion()
            }
        }
    }

    func fetchPlayers(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchPlayers { result in
            switch result {
            case .success(let players):
                self.players = players
                completion()
            case .failure(let error):
                print("Error fetching players: \(error)")
                completion()
            }
        }
    }

    func player(for id: Int) -> Player? {
        return players.first { $0.id == id }
    }

    func matchOutcome(for match: Matches) -> (color: UIColor, result: String) {
        guard let playerID = selectedPlayerID else { return (.white, "Draw") }

        if match.player1.id == playerID {
            if match.player1.score > match.player2.score {
                return (.green, "Win")
            } else if match.player1.score < match.player2.score {
                return (.red, "Loss")
            } else {
                return (.white, "Draw")
            }
        } else if match.player2.id == playerID {
            if match.player2.score > match.player1.score {
                return (.green, "Win")
            } else if match.player2.score < match.player1.score {
                return (.red, "Loss")
            } else {
                return (.white, "Draw")
            }
        }
        return (.white, "Draw")
    }
}

