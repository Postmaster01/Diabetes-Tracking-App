//
//  SignUpView.swift
//  diabetesTrackV2
//
//  Created by Eduardo Reyes on 4/5/23.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import FirebaseAuth

struct SignUpView: View {
    @EnvironmentObject var userVM: UserViewModel
    @State var user: User
    @State var fn = ""
    @State var CurrentUser = []
    
    
    
    
    var body: some View {
        VStack {
            
            
            Text("Your Information:")
                .padding(.bottom)
                .font(.largeTitle.bold())
            Group {
                TextField("First Name: \(userVM.user.fn)", text: $user.fn)
                TextField("Last Name: \(userVM.user.ln)", text: $user.ln)
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
            
            Group {
                TextField("Age: \(userVM.user.age)", text: $user.age)
                TextField("Weight: lbs \(userVM.user.weight)", text: $user.weight)
                TextField("Height: \(userVM.user.height)", text: $user.height)
                TextField("Diabetes Type: \(userVM.user.dt)", text: $user.dt)
                TextField("BMI: \(userVM.user.bmi)", text: $user.bmi)
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
            .keyboardType(.numbersAndPunctuation)
            
            Button {
                Task {
                    let success = await userVM.saveUser(user: user)
                    if success {
                        print("success")
                    } else {
                        print("Error saving")
                    }
                }
            } label: {
                Text("Save/Update")
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("APPColor"))
            .font(.title3)
        }
        .onAppear() {
            self.userVM.getData()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignUpView(user: User())
                .environmentObject(UserViewModel())
        }

    }
}


