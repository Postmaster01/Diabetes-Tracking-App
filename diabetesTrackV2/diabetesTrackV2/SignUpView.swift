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
    enum Field {
        case fn, ln, age, wt, ht, dt, bmi
    }
    @EnvironmentObject var userVM: UserViewModel
    @State var user: User
    @State var fn = ""
    @State var CurrentUser = []
    @FocusState private var focusField: Field?
    
    
    
    
    var body: some View {
        VStack {
            
            
            Text("Your Information:")
                .padding(.bottom)
                .font(.largeTitle.bold())
            Group {
                TextField("First Name: \(userVM.user.fn)", text: $user.fn)
                    .submitLabel(.next)
                    .focused($focusField, equals: .fn)
                    .onSubmit {
                        focusField = .ln
                    }
                TextField("Last Name: \(userVM.user.ln)", text: $user.ln)
                    .submitLabel(.next)
                    .focused($focusField, equals: .ln)
                    .onSubmit {
                        focusField = .age
                    }
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
            
            Group {
                TextField("Age: \(userVM.user.age)", text: $user.age)
                    .focused($focusField, equals: .age)
                    .onSubmit {
                        focusField = .wt
                    }
                TextField("Weight: lbs \(userVM.user.weight)", text: $user.weight)
                    .focused($focusField, equals: .wt)
                    .onSubmit {
                        focusField = .ht
                    }
                TextField("Height: \(userVM.user.height)", text: $user.height)
                    .focused($focusField, equals: .ht)
                    .onSubmit {
                        focusField = .dt
                    }
                TextField("Diabetes Type: \(userVM.user.dt)", text: $user.dt)
                    .focused($focusField, equals: .dt)
                    .onSubmit {
                        focusField = .bmi
                    }
                TextField("BMI: \(userVM.user.bmi)", text: $user.bmi)
                    .focused($focusField, equals: .bmi)
                    .onSubmit {
                        focusField = nil
                    }
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
            .keyboardType(.numberPad)
            
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


