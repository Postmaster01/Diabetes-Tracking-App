//
//  LineChartView.swift
//  diabetesTrackV2
//
//  Created by Eduardo Reyes on 4/7/23.
//

import SwiftUI
import UIKit
import Charts

struct Amount: Identifiable {
    var day: String
    var amount: Double
    var id = UUID()
}
struct LineChartView: View {
    @EnvironmentObject var userVM: UserViewModel
    @State var user: User
    
    var body: some View {
        
        VStack {
            Text("Graph")
                //.foregroundColor(Color("APPColor"))
                .font(.largeTitle.bold())
            
            
               

            
            Chart (content: {
                ForEach(userVM.mmolD) {item in
                    let stringdate = item.date
                    let dateformatter = DateFormatter()
                    let dateDate = dateformatter.date(from: stringdate)
                    PointMark(
                        x:.value("\(item.intDate)", item.date),
                        y:.value("\(item.mmolR)", item.mmolR))
                }
                
            })
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .padding()
            
            .chartYAxisLabel("mmol", position: .topTrailing, alignment: .bottomLeading, spacing: 15)
        .navigationBarBackButtonHidden()
        }
        .onAppear() {
            self.userVM.getAllMmol()
        }
        
        
        
    }
        
}
/*struct LineChartView: View {

    var body: some View {
        @IBOutlet weak var chartView: LineChartView!
        class ViewController: UIViewController {

            //@IBOutlet weak var chartView: LineChartView!

            override func viewDidLoad() {
                self.viewDidLoad()

                // Sample data for the chart
                let dataEntries = [
                    self.ChartDataEntry(x: 0, y: 5),
                    self.ChartDataEntry(x: 1, y: 10),
                    self.ChartDataEntry(x: 2, y: 7),
                    self.ChartDataEntry(x: 3, y: 12),
                    self.ChartDataEntry(x: 4, y: 9),
                    self.ChartDataEntry(x: 5, y: 15)
                ]

                // Set up the line chart data set
                let chartDataSet = self.LineChartDataSet(entries: dataEntries, label: "Sample Data")
                chartDataSet.colors = [UIColor.blue]

                // Set up the line chart data
                let chartData = self.LineChartData(dataSet: chartDataSet)

                // Set up the chart view
                self.chartView.data = chartData
                self.chartView.xAxis.labelPosition = .bottom
                self.chartView.animate(xAxisDuration: 1.0, yAxisDuration: 1.0)
            }
        }
    }
    
}*/

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LineChartView(user: User())
        }
        
    }
}
