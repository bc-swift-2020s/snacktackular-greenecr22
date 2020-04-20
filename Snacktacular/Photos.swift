//
//  Photos.swift
//  Snacktacular
//
//  Created by Christopher Greene on 4/20/20.
//  Copyright © 2020 Christopher Greene. All rights reserved.
//

import Foundation
import Firebase

class Photos {
    var photoArray: [Photo] = []
    var db: Firestore!
    
    init() {
        db = Firestore.firestore()
    }
}
