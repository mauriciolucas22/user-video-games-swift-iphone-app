//
//  AddGamesViewController.swift
//  App Test
//
//  Created by Mac on 26/12/20.
//

import UIKit

protocol AddNewGameDelegate {
    func addGame(_ game: Game)
}

class AddGamesViewController: UIViewController {
    
    @IBOutlet var gameName: UITextField?
    var delegate: AddNewGameDelegate?
    
    init(delegate: AddNewGameDelegate) {
        super.init(nibName: "AddGamesViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addGame(_ sender: Any) {
        
        guard let game = gameName?.text, gameName?.text != "" else {return}
        
        delegate?.addGame(Game(game))
        navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
