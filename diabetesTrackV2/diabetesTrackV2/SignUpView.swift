//
//  SignUpView.swift
//  diabetesTrackV2
//
//  Created by Eduardo Reyes on 4/5/23.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    @EnvironmentObject var userVM: UserViewModel
    @State var user: User
   
    
    var body: some View {
        VStack {
            Text("Your Information:")
                .padding(.bottom)
                .font(.largeTitle.bold())
            Group {
                TextField("First Name", text: $user.fn)
                TextField("Last Name", text: $user.ln)
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
            
            Group {
                TextField("Age", text: $user.age)
                TextField("Weight", text: $user.weight)
                TextField("Height", text: $user.height)
                TextField("Diabetes Type", text: $user.dt)
                TextField("BMI", text: $user.bmi)
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
                Text("Save")
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("APPColor"))
            .font(.title3)
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


