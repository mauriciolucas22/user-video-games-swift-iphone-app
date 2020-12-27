//
//  People.swift
//  App Test
//
//  Created by Mac on 26/12/20.
//

import UIKit

class User: NSObject {
    
    var name: String
    var games: Array<Game> = []

    // MARK: - Init
    init(_ name: String, _ games: [Game]? = []) {
        self.name = name
        
        guard let _games = games else {
            return
        }
        
        self.games = _games
    }
    
    // MARK: - addGame
    func addGame(_ game: Game) {
        self.games.append(game)
    }
}
