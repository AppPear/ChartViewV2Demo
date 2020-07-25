//
//  ContentView.swift
//  ChartViewV2Demo
//
//  Created by Samu András on 2020. 07. 25..
//  Copyright © 2020. Samu András. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @State var data1: [Double] = (0..<16).map { _ in .random(in: 9.0...100.0) }
    @State var data2: [Double] = (0..<16).map { _ in .random(in: 9.0...100.0) }
    @State var data3: [Double] = (0..<12).map { _ in .random(in: 9.0...100.0) }

    let mixedColorStyle = ChartStyle(backgroundColor: .white, foregroundColor: [
        ColorGradient(ChartColors.orangeBright, ChartColors.orangeDark),
        ColorGradient(.purple, .blue)
    ])
    let blueStlye = ChartStyle(backgroundColor: .white,
                               foregroundColor: [ColorGradient(.purple, .blue)])
    let orangeStlye = ChartStyle(backgroundColor: .white,
                                 foregroundColor: [ColorGradient(ChartColors.orangeBright, ChartColors.orangeDark)])

    var body: some View {
        VStack(alignment: .center, spacing: 12.0) {
            BarChart()
                .data(data2)
                .chartStyle(mixedColorStyle)

            CardView(showShadow: false) {
                ChartLabel("Title", type: .subTitle)
                LineChart()
            }
            .data(data1)
            .chartStyle(blueStlye)

            CardView {
                ChartLabel("Title", type: .title)
                BarChart()
            }
            .data(data3)
            .chartStyle(orangeStlye)
            .frame(width: 160, height: 240)
            .padding()

            Button(action: {
                self.data1 = (0..<16).map { _ in .random(in: 9.0...100.0) } as [Double]
                self.data2 = (0..<16).map { _ in .random(in: 9.0...100.0) } as [Double]
                self.data3 = (0..<16).map { _ in .random(in: 9.0...100.0) } as [Double]
            }) {
                Text("Shuffle baby")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
