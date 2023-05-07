//
//  UserViewModel.swift
//  diabetesTrackV2
//
//  Created by Eduardo Reyes on 4/10/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseCore
import FirebaseFirestoreSwift
import SwiftUI

class UserViewModel: ObservableObject {
    @Published var user = User()
    @Published var userData = [User]()
    @Published var mmol = MMOL()
    @Published var mmolD = [MMOL]()
    
    func saveUser(user: User) async -> Bool {
        let db = Firestore.firestore()
        let curUser = Auth.auth().currentUser
        let uid = curUser?.uid
        if let uid = uid {
            do {
                try await db.collection("users").document(uid).setData(user.dictionary)
                print("Data updated successfully")
                return true
            } catch {
                print("ERROR: Could not update data in 'users' \(error.localizedDescription)")
                return false
            }
        } else {
            do {
                try await db.collection("users").addDocument(data: user.dictionary)
                print("Data added successfully")
                return true
            } catch {
                print("ERROR: Could not update data in 'users' \(error.localizedDescription)")
                return false
            }
        }
    }
    
    func getData() {
        let db = Firestore.firestore()
        let curUser = Auth.auth().currentUser
        let uid = curUser?.uid
        let docRef = db.collection("users").document(uid!)
        
        docRef.getDocument { (document, error) in
            
            if error == nil {
                
                if document != nil && document!.exists {
                    
                    let documentData = document?.data()
                    
                    self.user.fn = documentData?["fn"] as! String
                    self.user.ln = documentData?["ln"] as! String
                    self.user.age = documentData?["age"] as! String
                    self.user.weight = documentData?["weight"] as! String
                    self.user.height = documentData?["height"] as! String
                    self.user.dt = documentData?["dt"] as! String
                    self.user.bmi = documentData?["bmi"] as! String
                    
                    print(self.user.fn)
                    
                }
            }
        }
    }
    
    func setMmol(mmol: MMOL) async -> Bool {
        let db = Firestore.firestore()
        let curUser = Auth.auth().currentUser
        let uid = curUser?.uid
        let date = Date()
        let df = DateFormatter()
        df.dateStyle = DateFormatter.Style.short
        df.timeStyle = DateFormatter.Style.short
        let curDate = df.string(from: date)
        
        do {
            try await db.collection("users").document(uid!).collection("mmolReadings").addDocument(data: mmol.mmoldictionary)
            
            return true
        } catch {
            print("ERROR: Could not save data in 'mmol' \(error.localizedDescription)")
            return false
        }
    }
    
    func getAllMmol() {
        let db = Firestore.firestore()
        let curUser = Auth.auth().currentUser
        let uid = curUser?.uid
        
        db.collection("users").document(uid!).collection("mmolReadings").order(by: "date", descending: false).addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No Documents")
                return
            }
            
            self.mmolD = documents.map { (queryDocumentSnapshot) -> MMOL in
                let data = queryDocumentSnapshot.data()
                
                let mmolR = data["mmolR"] as? Double ?? 0
                let date = data["date"] as? String ?? ""
                let intDate = data["intDate"] as? Int ?? 0
                
                return MMOL(mmolR: mmolR, date: date, intDate: intDate)
            }
        }
    }
    
}
