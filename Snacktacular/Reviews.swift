//
//  Reviews.swift
//  Snacktacular
//
//  Created by Christopher Greene on 4/20/20.
//  Copyright © 2020 Christopher Greene. All rights reserved.
//

import Foundation
import Firebase

class Reviews {
    var reviewArray: [Review] = []
    var db: Firestore!
    
    init() {
        db = Firestore.firestore()
    }
    
    func loadData(spot: Spots, completed: @escaping () -> ()) {
        guard spots.documentID != "" else {
            return
        }
        db.collection("spots").document(spots.documentID).collection("reviews").addSnapshotListener { (querySnapshot, error) in
            guard error == nil else {
                print("Error: adding the snapshot listener")
                return completed()
            }
            
            self.reviewArray = []
            // there are querysnapshot!.documents.count in snapshot
            for document in querySnapshot!.documents {
                let review = Review(dictionary: document.data())
                review.documentID = document.documentID
                self.reviewArray.append(review)
            }
            
            completed()
            
        }
    }
}
