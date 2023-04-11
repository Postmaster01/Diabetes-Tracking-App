//
//  User.swift
//  diabetesTrackV2
//
//  Created by Eduardo Reyes on 4/10/23.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    @DocumentID var id: String?
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
