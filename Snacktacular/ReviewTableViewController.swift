//
//  ReviewTableViewController.swift
//  Snacktacular
//
//  Created by Christopher Greene on 4/20/20.
//  Copyright © 2020 Christopher Greene. All rights reserved.
//

import UIKit

class ReviewTableViewController: UITableViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var postedByLabel: UILabel!
    @IBOutlet weak var reviewTitle: UITextField!
    @IBOutlet weak var reviewDateLabel: UILabel!
    @IBOutlet weak var reviewView: UITextView!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var buttonsBackgroundView: UIView!

    @IBOutlet var starButtonCollection: [UIButton]!
    
    var rating = 0  {
        didSet {
            for starButton in starButtonCollection {
                let image = UIImage(named: (starButton.tag < rating ? "star-filled" : "star-empty"))
                starButton.setImage(image, for: .normal)
                
            }
            
            
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    func leaveViewController() {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func reviewTitleChanged(_ sender: UITextField) {
    }
    
    @IBAction func returnTitleDonePressed(_ sender: UITextField) {
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        leaveViewController()
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    
    @IBAction func starButtonPressed(_ sender: UIButton) {
        rating = sender.tag + 1
    }
}
