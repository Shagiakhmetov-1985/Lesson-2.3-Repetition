//
//  ImageViewController.swift
//  Lesson 2.3 Repetition
//
//  Created by Marat Shagiakhmetov on 26.10.2021.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: user.person.image)
    }
}
