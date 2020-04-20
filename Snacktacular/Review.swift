//
//  Review.swift
//  Snacktacular
//
//  Created by Christopher Greene on 4/20/20.
//  Copyright © 2020 Christopher Greene. All rights reserved.
//

import Foundation
import Firebase

class Review {
    var title: String
    var text: String
    var rating: Int
    var reviewerUserID: String
    var date: Date
    var documentID: String
    
    var dictionary: [String: Any] {
        return ["title": title, "text": text, "rating": rating, "reviewerUserID": reviewerUserID, "date": Date(), "documentID": documentID]
    }
    
    init(title: String, text: String, rating: Int, reviewerUserID: String, date: Date, documentID: String) {
        self.title = title
        self.text = text
        self.rating = rating
        self.reviewerUserID = reviewerUserID
        self.date = date
        self.documentID = documentID
        
        
    }
    
    convenience init() {
        let currentUserID = Auth.auth().currentUser?.email ?? "Unkown user"
        self.init(title: "", text: "", rating: 0, reviewerUserID: currentUserID, date: Date(), documentID: "")
    }
    
    func saveData(spot: Spot, completed: @escaping (Bool) -> ()) {
        let db = Firestore.firestore()
        //create dictionary
        
        let dataToSave = self.dictionary
        //if we have have a saved record, we'll have a doc id
        
        if self.documentID != "" {
            let ref = db.collection("spots").document(spot.documentID).collection("reviews").document(self.documentID)
            ref.setData(dataToSave) { (error) in
                if let error = error {
                    completed(false)
                } else {
                    completed(true)
                }
                
            }
        } else {
            var ref: DocumentReference? = nil
            ref = db.collection("spots").document(spot.documentID).collection("reviews").addDocument(data: dataToSave) { error in
                if let error = error {
                    completed(false)
                } else {
                    completed(true)
                }
            }
        }
    }
    
    
}
