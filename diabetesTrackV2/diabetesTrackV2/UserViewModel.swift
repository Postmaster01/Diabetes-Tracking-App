//
//  UserViewModel.swift
//  diabetesTrackV2
//
//  Created by Eduardo Reyes on 4/10/23.
//

import Foundation
import FirebaseFirestore

class UserViewModel: ObservableObject {
    @Published var user = User()
    
    func saveUser(user: User) async -> Bool {
        let db = Firestore.firestore()
        
        if let id = user.id {
            do {
                try await db.collection("users").document(id).setData(user.dictionary)
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
}
