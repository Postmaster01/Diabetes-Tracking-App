//
//  HomeView.swift
//  diabetesTrackV2
//
//  Created by Eduardo Reyes on 4/5/23.
//

import SwiftUI
import Firebase

struct CalculatorView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var userVM: UserViewModel
    @State var mmolO: MMOL
    @State var answer = ""
    @State var mmol = ""
    @State var mgdlCalc = ""
    @State var calcText = ""
    @State var calcM = ""
    @State var text = ""
    
    
    
    var body: some View {
       
        
            VStack{
                    Text("Calculator")
                        .frame(alignment: .top)
                        .offset(y:-100)
                        .font(.largeTitle.bold())
                    VStack {
                        Text("Have you eaten in the last 8 hours?")
                            .padding(.bottom)
                        HStack(alignment: .center) {
                            
                            RadioButtonField(
                                id: "Yes",
                                label: "Yes",
                                color: .black,
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
                        .font(.title3)
                        
                        
                        Text("What is your current mmol/L reading? :")
                            .padding(.top)
                        TextField("mmol/L", text: $mmol)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal)
                            .keyboardType(.numbersAndPunctuation)
                            .padding(.bottom)
                        
                        HStack {
                            Button {
                                calculate()
                                
                            } label: {
                                Text("Calculate")
                            }
                            
                            Button {
                                Task {
                                    let success = await userVM.setMmol(mmol: mmolO)
                                    if success {
                                        print("success")
                                    } else {
                                        print("failed saving")
                                    }
                                }
                            } label: {
                                Text("Save Value")
                            }

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
        }
       
    func calculate() {
        if !mmol.isEmpty {
            let date = Date()
            let timeInterval = date.timeIntervalSince1970
            let intTime = Int(timeInterval)
            let df = DateFormatter()
            df.dateStyle = DateFormatter.Style.short
            let curDate = df.string(from: date)
            let mmolNum = Double(mmol) ?? 0
            let mgdlNum = mmolNum * 18
            
            mgdlCalc = String(mgdlNum)
            mmolO.mmolR = mgdlNum
            mmolO.date = curDate
            mmolO.intDate = intTime
            print("\(df)")
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
            CalculatorView(mmolO: MMOL())
                .environmentObject(UserViewModel())
        }
        
    }
}
