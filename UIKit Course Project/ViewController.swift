//
//  ViewController.swift
//  UIKit Course Project
//
//  Created by Дмитрий Лещёв on 11/04/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup main label
        mainLabel.text = ""
        mainLabel.font = mainLabel.font.withSize(35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        
        // Setup segment control
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
    }

    @IBAction func changeSegment() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .blue
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .white
        case 2:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .yellow
        default:
            break
        }
    }
    
}

