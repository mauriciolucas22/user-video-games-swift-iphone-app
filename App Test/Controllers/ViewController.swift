//
//  ViewController.swift
//  App Test
//
//  Created by Mac on 26/12/20.
//

import UIKit

protocol AddUserDelegate {
    func add(_ user: User)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddUserDelegate, AddNewGameDelegate {
    // MARK: - Games
    var games: [Game] = [Game("PS5"), Game("Xbox Series X"), Game("PC"), Game("Nintendo Switch"), Game("PSP")]
    var selectedGames: [Game] = []
    
    // MARK: - OBOutlet
    @IBOutlet var name: UITextField!
    @IBOutlet weak var gamesTableView: UITableView!
    
    // MARK: - Delegate
    var delegate: AddUserDelegate?
    
    // MARK: - Life Cyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonAddGame = UIBarButtonItem(title: "Add game", style: .plain, target: self, action: #selector(self.addGameView))
        navigationItem.rightBarButtonItem = buttonAddGame
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gameViewController = segue.destination as? AddGamesViewController {
            gameViewController.delegate = self
        }
    }
    
    func addGame(_ game: Game) {
        games.append(game)
        gamesTableView.reloadData()
    }
    
    @objc func addGameView() {
        let addGameViewController = AddGamesViewController(delegate: self)
        navigationController?.pushViewController(addGameViewController, animated: true)
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) else {return}
        
        if cell.accessoryType == .none {
            cell.accessoryType = .checkmark
            
            // add game into selectedGames
            selectedGames.append(games[indexPath.row])
        } else {
            cell.accessoryType = .none
            let item = games[indexPath.row]
            guard let position = selectedGames.firstIndex(of: item) else { return }
            
            selectedGames.remove(at: position)
            
        }
        
        
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let row = indexPath.row
        let game = games[row]
        
        cell.textLabel?.text = game.name
        
        return cell
    }
    
    @IBAction func add(_ user: User) {
        guard let valueName = name?.text else {
            return
        }
        
        if valueName == "" {
            return
        }
        
        let user = User(valueName, selectedGames)
        
        print(user.games)

        delegate?.add(user)
        navigationController?.popViewController(animated: true)
    }


}

