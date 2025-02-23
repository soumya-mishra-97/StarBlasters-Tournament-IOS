import Foundation

class PointsTableViewModel {
    var pointsTable: [(player: Player, totalScore: Int)] = []
    
    func fetchTournamentData(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchPlayers { [weak self] playerResult in
            switch playerResult {
            case .success(let players):
                self?.processPlayers(players)
                NetworkManager.shared.fetchMatches { matchResult in
                    switch matchResult {
                    case .success(let matches):
                        self?.processMatches(matches)
                        completion()
                    case .failure(let error):
                        print("Failed to fetch matches: \(error)")
                        completion()
                    }
                }
            case .failure(let error):
                print("Failed to fetch players: \(error)")
                completion()
            }
        }
    }
    
    private func processPlayers(_ players: [Player]) {
        pointsTable = players.map { (player: $0, totalScore: 0) }
    }
    
    private func processMatches(_ matches: [Matches]) {
        for match in matches {
            updatePlayerScore(for: match.player1)
            updatePlayerScore(for: match.player2)
        }
    }
    
    private func updatePlayerScore(for playerScore: PlayerScore) {
        if let index = pointsTable.firstIndex(where: { $0.player.id == playerScore.id }) {
            pointsTable[index].totalScore += playerScore.score
        }
    }
}
