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
        VStack{
            NavigationLink {
                SignUpView()
            } label: {
                Image(systemName: "person")
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    SignUpView()
                } label: {
                    Image(systemName: "person")
                }


            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Sign Out") {
                    do {
                        try Auth.auth().signOut()
                        print("Log out success")
                        dismiss()
                    } catch {
                        print("ERROR: could not sign out")
                    }
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
