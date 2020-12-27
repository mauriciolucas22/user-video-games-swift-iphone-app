//
//  UsersTableViewController.swift
//  App Test
//
//  Created by Mac on 26/12/20.
//

import UIKit

class UsersTableViewController: UITableViewController, AddUserDelegate {
    var users: [User] = [
        User("Mauricio", [Game("PS5")])
    ]
    
    // click add tabbar button
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add" {
            // parse segue.destination to ViewController and setup protocol to this self controller
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        
        return cell
    }
    
    func add(_ user: User) {
        users.append(user)
        tableView.reloadData()
    }
    

}
