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
    @State var answer = ""
    @State var mmol = ""
    @State var mgdlCalc = ""
    @State var calcText = ""
    @State var calcM = ""
    @State var text = ""
    @State var path = NavigationPath()
    
    var body: some View {
        
        VStack{
            Text("Calculator")
                .frame(alignment: .top)
                .offset(y:-100)
                .font(.title)
                .fontWeight(.bold)
            VStack {
                Text("Have you eaten in the last 8 hours?")
                    .padding(.bottom)
                HStack(alignment: .center) {
                    
                    RadioButtonField(
                        id: "Yes",
                        label: "Yes",
                        color:.black,
                        bgColor: Color("APPColor"),
                        isMarked: $answer.wrappedValue == "Yes" ? true : false,
                        callback: { selected in
                            self.answer = selected
                            print("Selected Gender is: \(selected)")
                        }
                    )
                    
                    
                    RadioButtonField(
                        id: "No",
                        label: "No",
                        color:.black,
                        bgColor: Color("APPColor"),
                        isMarked: $answer.wrappedValue == "No" ? true : false,
                        callback: { selected in
                            self.answer = selected
                            print("Selected Gender is: \(selected)")
                        }
                    )
                    
                    
                    
                }
                .offset(x:75)
                .padding(.bottom)
                
                
                Text("What is your current mmol/L reading? :")
                    .padding(.top)
                TextField("mmol/L", text: $mmol)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                    .keyboardType(.numbersAndPunctuation)
                    .padding(.bottom)
                
                Button {
                    calculate()
                    
                } label: {
                    Text("Calculate")
                }
                .buttonStyle(.borderedProminent)
                .tint(Color("APPColor"))
                .foregroundColor(.white)
                
                TextField("", text: $calcText)
                    .frame(width: 309, height: 10)
                
                    .padding([.top, .leading, .trailing])
                HStack(alignment: .center) {
                    
                    TextField("",text: $mgdlCalc)
                        .frame(width: 60, height: 10)
                    
                    
                    TextField("", text: $calcM)
                    
                }
                .offset(x: 138)
                
                TextField("", text: $text)
                    .offset(x: 90)
                    .padding(.top)
                
              
                
                
                
                
                
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                NavigationLink {
                    SignUpView()
                } label: {
                    Image(systemName: "person")
                }
                .id(UUID())
                
                
            }
            
            ToolbarItem(placement: .bottomBar) {
                Button {
                    //
                } label: {
                    Image(systemName: "app")
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
                .buttonStyle(.borderedProminent)
                .tint(Color("APPColor"))
                .foregroundColor(.white)
                
            }
        }
        .foregroundColor(Color("APPColor"))
    }
    
    
    
    func calculate() {
        if !mmol.isEmpty {
            let mmolNum = Double(mmol) ?? 0
            let mgdlNum = mmolNum * 18
            
            mgdlCalc = String(mgdlNum)
            
            if mgdlNum <= 70 {
                text = "Your blood sugar is low"
            } else {
                text = "Your blood sugar is normal"
            }
            
        }
        if !mgdlCalc.isEmpty {
            calcText = "Your current Blood Glucose is (mg/dL): "
            calcM = "mg/dL"
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
