//
//  AboutMeViewController.swift
//  Lesson 2.3 Repetition
//
//  Created by Marat Shagiakhmetov on 26.10.2021.
//

import UIKit

class AboutMeViewController: UIViewController {

    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? ImageViewController else { return }
        imageVC.user = user
    }
}
