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
	@State var data4: [Double] = (0..<8) .map { _ in .random(in: 1.0...125.0) }

	let mixedColorStyle = ChartStyle(backgroundColor: .white, foregroundColor: [
		ColorGradient(ChartColors.orangeBright, ChartColors.orangeDark),
		ColorGradient(.purple, .blue)
	])
	let blueStyle = ChartStyle(backgroundColor: .white,
							   foregroundColor: [ColorGradient(.purple, .blue)])
	let orangeStyle = ChartStyle(backgroundColor: .white,
								 foregroundColor: [ColorGradient(ChartColors.orangeBright, ChartColors.orangeDark)])

	let multiStyle = ChartStyle(backgroundColor: Color.green.opacity(0.2),
								foregroundColor:
									[ColorGradient(.purple, .blue),
									 ColorGradient(.orange, .red),
									 ColorGradient(.green, .yellow),
									 ColorGradient(.red, .purple),
									 ColorGradient(.yellow, .orange),
									])

	var body: some View {
		VStack {

			HStack {
				Button(action: {
					self.data1 = (0..<16).map { _ in .random(in: 9.0...100.0) } as [Double]
					self.data2 = (0..<16).map { _ in .random(in: 9.0...100.0) } as [Double]
					self.data3 = (0..<16).map { _ in .random(in: 9.0...100.0) } as [Double]
					self.data4 = (0..<8) .map { _ in .random(in: 1.0...125.0) } as [Double]
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
					.chartStyle(orangeStyle)
					.frame(width: 160, height: 240)
					.padding()
				}
				.tabItem { Image(systemName:"chart.bar.xaxis") }.tag(1)
				VStack {

					PieChart()
						.data(data1)
						.chartStyle(orangeStyle)

					CardView {
						ChartLabel("Pie Chart", type: .title)
						PieChart()
					}
					.data(data2)
					.chartStyle(blueStyle)
					.padding()


				}
				.tabItem { Image(systemName:"chart.pie.fill") }.tag(2)



				VStack {

					CardView(showShadow: true) {
						ChartLabel("Line Chart", type: .subTitle)
						LineChart()
					}
					.data(data1)
					.chartStyle(blueStyle)
					.padding()


					LineChart()
						.data(data2)
						.chartStyle(orangeStyle)

				}
				.tabItem { Image(systemName:"waveform.path.ecg.rectangle") }.tag(3)

				VStack {

					RingsChart()
						.data(self.data4)
						.chartStyle(multiStyle)
						.padding()

					CardView(showShadow: false) {
						ChartLabel("Rings Chart", type: .legend)
						RingsChart()
					}
						.data(Array(self.data4[0...2]))
						.chartStyle(multiStyle)
						.frame(width: 130, height: 130)
						.padding([.bottom])

				}
				.tabItem { Image(systemName:"circle") }.tag(4)
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

