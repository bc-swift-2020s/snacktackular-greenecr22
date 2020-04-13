//
//  Spots.swift
//  Snacktacular
//
//  Created by Christopher Greene on 4/12/20.
//  Copyright © 2020 Christopher Greene. All rights reserved.
//

import Foundation
import Firebase

class Spots {
    var spotArray = [Spot]()
    var db: Firestore!
    
    init() {
        db = Firestore.firestore()
    }
    
    func loadData(completed: @escaping () -> ()) {
        db.collection("spots").addSnapshotListener { (querySnapshot, error) in
            guard error == nil else {
                print("Error: adding the snapshot listener")
                return completed()
            }
            
            self.spotArray = []
            // there are querysnapshot!.documents.count in snapshot
            for document in querySnapshot!.documents {
                let spot = Spot(dictionary: document.data())
                spot.documentID = document.documentID
                self.spotArray.append(spot)
            }
            
            completed()
            
        }
    }
    
    
}
