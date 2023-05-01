//
//  User.swift
//  diabetesTrackV2
//
//  Created by Eduardo Reyes on 4/10/23.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

let curUser = Auth.auth().currentUser


struct User: Identifiable, Codable {
    @DocumentID var id = curUser?.uid
    var email = ""
    var fn = ""
    var ln = ""
    var age = ""
    var weight = ""
    var height = ""
    var dt = ""
    var bmi = ""
    
    
    var dictionary: [String: Any] {
        return ["fn": fn, "ln": ln, "age": age, "weight": weight, "height": height, "dt": dt, "bmi": bmi]
    }
    
}

struct MMOL: Identifiable, Codable {
    @DocumentID var id: String?
    var mmolR = 0.0
    var date = ""
    var intDate = 0
    
    var mmoldictionary: [String: Any] {
        return ["mmolR": mmolR, "date": date, "intDate": intDate]
    }
}
