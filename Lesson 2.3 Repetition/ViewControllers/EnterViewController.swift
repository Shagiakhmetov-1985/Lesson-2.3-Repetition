//
//  EnterViewController.swift
//  Lesson 2.3 Repetition
//
//  Created by Marat Shagiakhmetov on 25.10.2021.
//

import UIKit

class EnterViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.backgroundColor = .red
        welcomeLabel.text = "Welcome, \(user.person.fullname)"
    }
}
