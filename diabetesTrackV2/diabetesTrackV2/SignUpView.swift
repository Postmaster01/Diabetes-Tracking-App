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
    let name = "lalo"
    
    var body: some View {
        VStack {
            Text("Your Information:")
                .padding(.bottom)
                .offset(y:-50)
                .font(.largeTitle)
            Group {
                TextField("First Name", text: $fn)
                TextField("Last Name", text: $ln)
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
            
            Group {
                TextField("Weight", text: $weight)
                TextField("Height", text: $height)
                TextField("Diabetes Type", text: $dt)
                TextField("BMI", text: $bmi)
                
         
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
            .keyboardType(.numbersAndPunctuation)
            
        }
        
        Button {
            // save data to cloud
        } label: {
            Text("Save")
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
