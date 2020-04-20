//
//  SpotsTableViewCell.swift
//  Snacktacular
//
//  Created by Christopher Greene on 4/12/20.
//  Copyright © 2020 Christopher Greene. All rights reserved.
//

import UIKit
import CoreLocation

class SpotsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    var currentLocation: CLLocation!
    var spot: Spot!
    
    func configureCell(spot: Spot) {
        nameLabel.text = spot.name
        
        guard let currentLocation = currentLocation else {
            return
        }
        
        let distanceInMeters = currentLocation.distance(from: spot.location)
        let distanceString = "Distance: \((distanceInMeters * 0.00062137).roundTo(places: 2)) miles"
        distanceLabel.text = distanceString
        
    }
    
}
