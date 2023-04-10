//
//  SignUpView.swift
//  diabetesTrackV2
//
//  Created by Eduardo Reyes on 4/5/23.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    
    @State private var fn = ""
    @State private var ln = ""
    @State private var age = ""
    @State private var weight = ""
    @State private var height = ""
    @State private var dt = ""
    @State private var bmi = ""
    
    var body: some View {
        VStack {
            Text("Your Information:")
                .padding(.bottom)
                .font(.largeTitle.bold())
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
            
            Button {
                //
            } label: {
                Text("Save")
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("APPColor"))
            .font(.title3)
        }
    }
    
    func save() {
        if !fn.isEmpty {
            fn = fn
        }
    }
        
            
        
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignUpView()
        }

    }
}


