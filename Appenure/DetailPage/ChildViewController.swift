//
//  ChildViewController.swift
//  Appenure
//
//  Created by Shivendra on 30/11/24.
//

import UIKit

class ChildViewController: UIViewController {
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @objc dynamic var descriptionText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = descriptionText
    }
}
