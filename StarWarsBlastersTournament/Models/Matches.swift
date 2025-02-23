//
//  Match.swift
//  StarWarsBlastersTournament
//
//  Created by Soumya Ranjan Mishra on 11/07/24.
//

import Foundation

struct PlayerScore: Decodable {
    let id: Int
    let score: Int
}

struct Matches: Decodable {
    let match: Int
    let player1: PlayerScore
    let player2: PlayerScore
}
