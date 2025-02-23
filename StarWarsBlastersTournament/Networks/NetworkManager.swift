//
//  NetworkManager.swift
//  StarWarsBlastersTournament
//
//  Created by Soumya Ranjan Mishra on 11/07/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchPlayers(completion: @escaping (Result<[Player], NetworkError>) -> Void) {
        APIRequestHelper.shared.request(URLProvider.playerList) { (result: Result<[Player], NetworkError>) in
            switch result {
            case .success(let players):
                completion(.success(players))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchMatches(completion: @escaping (Result<[Matches], NetworkError>) -> Void) {
        APIRequestHelper.shared.request(URLProvider.matchList) { (result: Result<[Matches], NetworkError>) in
            switch result {
            case .success(let matches):
                completion(.success(matches))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
