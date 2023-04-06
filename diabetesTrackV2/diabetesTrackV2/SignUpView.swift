//
//  SignUpView.swift
//  diabetesTrackV2
//
//  Created by Eduardo Reyes on 4/5/23.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var fn = ""
    @State private var ln = ""
    @State private var age = ""
    @State private var weight = ""
    @State private var height = ""
    @State private var dt = ""
    @State private var bmi = ""
    
    var body: some View {
        NavigationStack{
            Group {
                TextField("First Name", text: $fn)
                TextField("Last Name", text: $ln)
                TextField("Weight", text: $weight)
                TextField("Height", text: $height)
                TextField("Diabetes Type", text: $dt)
                TextField("BMI", text: $bmi)
                
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
            
        }
        
        Button {
            // do something
        } label: {
            Text("Continue")
        }
            .buttonStyle(.borderedProminent)
            .tint(Color("APPColor"))
            .font(.title2)
            .padding(.top)
            .navigationBarTitleDisplayMode(.inline)

    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignUpView()
        }

    }
}
