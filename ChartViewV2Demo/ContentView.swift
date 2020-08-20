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

	@State private var selectedTab = 1

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
		VStack {

			HStack {
				Button(action: {
					self.data1 = (0..<16).map { _ in .random(in: 9.0...100.0) } as [Double]
					self.data2 = (0..<16).map { _ in .random(in: 9.0...100.0) } as [Double]
					self.data3 = (0..<16).map { _ in .random(in: 9.0...100.0) } as [Double]
				}) {
					Text("Shuffle baby")
				}

				Spacer()
				// Other controls
			}
			.padding()

			TabView(selection: $selectedTab) {

				VStack {

					BarChart()
						.data(data2)
						.chartStyle(mixedColorStyle)


					CardView {
						ChartLabel("Bar Chart", type: .legend)
						BarChart()
					}
					.data(data3)
					.chartStyle(orangeStlye)
					.frame(width: 160, height: 240)
					.padding()
				}
				.tabItem { Image(systemName:"chart.bar.xaxis") }.tag(1)
				VStack {

					PieChart()
						.data(data1)
						.chartStyle(orangeStlye)

					CardView {
						ChartLabel("Pie Chart", type: .title)
						PieChart()
					}
					.data(data2)
					.chartStyle(blueStlye)
					.padding()


				}
				.tabItem { Image(systemName:"chart.pie.fill") }.tag(2)



				VStack {

					CardView(showShadow: true) {
						ChartLabel("Line Chart", type: .subTitle)
						LineChart()
					}
					.data(data1)
					.chartStyle(blueStlye)
					.padding()


					LineChart()
						.data(data2)
						.chartStyle(orangeStlye)

				}
				.tabItem { Image(systemName:"waveform.path.ecg.rectangle") }.tag(3)

				VStack {

					// More types to come

				}
				.tabItem { Image(systemName:"questionmark.diamond.fill") }.tag(4)
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

