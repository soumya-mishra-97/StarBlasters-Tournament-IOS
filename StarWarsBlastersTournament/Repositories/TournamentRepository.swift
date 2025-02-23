//
//  TournamentRepository.swift
//  StarWarsBlastersTournament
//
//  Created by Soumya Ranjan Mishra on 11/07/24.
//

import Foundation

class TournamentRepository {
    func getPlayers(completion: @escaping (Result<[Player], NetworkError>) -> Void) {
        NetworkManager.shared.fetchPlayers(completion: completion)
    }
    
    func getMatches(completion: @escaping (Result<[Matches], NetworkError>) -> Void) {
        NetworkManager.shared.fetchMatches(completion: completion)
    }
}

