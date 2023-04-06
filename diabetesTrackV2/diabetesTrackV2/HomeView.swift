//
//  HomeView.swift
//  diabetesTrackV2
//
//  Created by Eduardo Reyes on 4/5/23.
//

import SwiftUI
import Firebase

struct HomeView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        List {
            Text("Biometric data goes here")
        }
        .listStyle(.plain)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Sign Out") {
                    do {
                        try Auth.auth().signOut()
                        print("log out success")
                        dismiss()
                    } catch {
                        print("ERROR: Could not sign out")
                    }
                }
                
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    //todo: add item
                } label: {
                    Image(systemName: "plus")
                }

                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView()
        }
        
    }
}
