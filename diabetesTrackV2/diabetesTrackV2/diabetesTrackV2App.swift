//
//  diabetesTrackV2App.swift
//  diabetesTrackV2
//
//  Created by Eduardo Reyes on 3/13/23.
//

import SwiftUI
import Firebase

@main
struct diabetesTrackV2App: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
