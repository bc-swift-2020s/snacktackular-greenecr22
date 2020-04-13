//
//  SpotDetailViewController.swift
//  Snacktacular
//
//  Created by Christopher Greene on 4/12/20.
//  Copyright © 2020 Christopher Greene. All rights reserved.
//

import UIKit

class SpotDetailViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var averageRatingLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var spot: Spot!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if spot == nil {
            spot = Spot()
        }
        nameField.text = spot.name
        addressField.text = spot.address
    }

    @IBAction func photoButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func reviewButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}
