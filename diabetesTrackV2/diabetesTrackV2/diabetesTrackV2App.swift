//
//  diabetesTrackV2App.swift
//  diabetesTrackV2
//
//  Created by Eduardo Reyes on 3/13/23.
//

import SwiftUI
import Firebase
import FirebaseStorage

@main


struct diabetesTrackV2App: App {
    @StateObject var userVM = UserViewModel()
    
    init() {
        FirebaseApp.configure()
    }
        
        var body: some Scene {
            WindowGroup {
                LoginView()
                    .environmentObject(userVM)
            }
        }
    }

