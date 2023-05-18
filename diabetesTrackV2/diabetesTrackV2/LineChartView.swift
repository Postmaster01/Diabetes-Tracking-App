//
//  LineChartView.swift
//  diabetesTrackV2
//
//  Created by Eduardo Reyes on 4/7/23.
//

import SwiftUI
import UIKit
import Charts


struct LineChartView: View {
    @EnvironmentObject var userVM: UserViewModel
    @State var user: User
    
    var body: some View {
        
        VStack {
            Text("Glucose Levels Graph")
                .font(.largeTitle.bold())
            
            Chart (content: {
                ForEach(userVM.mmolD) {item in
                    PointMark(
                        x:.value("\(item.date)", item.date),
                        y:.value("mg/dl", item.mmolR))
                }
                
            })
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .padding()
            
            .chartYAxisLabel("mg/dl", position: .topTrailing, alignment: .bottomLeading, spacing: 15)
        .navigationBarBackButtonHidden()
        }
        .onAppear() {
            self.userVM.getAllMmol()
        }
        
    }
        
}


struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LineChartView(user: User())
        }
        
    }
}
