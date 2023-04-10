//
//  tabView.swift
//  diabetesTrackV2
//
//  Created by Eduardo Reyes on 4/10/23.
//

import SwiftUI
import Firebase

struct HomeView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        TabView {
            CalculatorView()
                .tabItem {
                    Image(systemName: "plus.square.fill")
                    Text("Calculator")
                }
            LineChartView()
                .tabItem {
                    Image(systemName: "arrow.up.right")
                    Text("Graph")
                }
            SignUpView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Information")
                }
        }
        .accentColor(Color("APPColor"))
        .navigationBarBackButtonHidden()
        .toolbar {
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
                .buttonStyle(.borderedProminent)
                .tint(Color("APPColor"))
                .foregroundColor(.white)
                
            }
        }
    }
}

struct tabView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView()
        }
    }
}
