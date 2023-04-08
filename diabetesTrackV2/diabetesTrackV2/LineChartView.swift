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
struct BarChart: View {
    
    var data: [Amount] = [
        .init(day: "Sunday", amount: 83.4),
        .init(day: "Monday", amount: 78.4),
        .init(day: "Tuesday", amount: 76.8),
        .init(day: "Wednesday", amount: 82.7),
        .init(day: "Thursday", amount: 89.3),
        .init(day: "Friday", amount: 86.9),
        .init(day: "Saturday", amount: 82.3)
        
    ]
    
    var body: some View {
        Chart (content: {
            LineMark(
                x: .value("Month", data[0].day),
                y: .value("Total", data[0].amount)
            )
            LineMark(
                 x: .value("Month", data[1].day),
                 y: .value("Total", data[1].amount)
            )
            LineMark(
                 x: .value("Month", data[2].day),
                 y: .value("Total", data[2].amount)
            )
            LineMark(
                x: .value("Month", data[3].day),
                y: .value("Total", data[3].amount)
            )
            LineMark(
                x: .value("Month", data[4].day),
                y: .value("Total", data[4].amount)
            )
            LineMark(
                x: .value("Month", data[5].day),
                y: .value("Total", data[5].amount)
            )
            LineMark(
                x: .value("Month", data[6].day),
                y: .value("Total", data[6].amount)
            )
        })
        .padding()
        .frame(width: 300, height: 300)
        .chartXAxisLabel("Day", position: .automatic, alignment: .center, spacing: 15)
        .chartYAxisLabel("mmol", position: .topTrailing, alignment: .bottomLeading, spacing: 15)
        
        //let dataSet = LineChartDataSet(values: content, label: "Foo")
        //dataSet.mode = .cubicBezier
        
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
        //LineChartView()
        BarChart()
    }
}
