//
//  Weather.swift
//  SwiftUI-Weather
//
//  Created by Дмитрий Власов on 24.03.2024.
//

import SwiftUI

struct WeatherHour: View {
    var time: String
    var temperature: Int
    let maxSize: Int = 75
    
    var body: some View {
        VStack {
            ZStack (alignment: .top) {
                Color.blue.frame(width: 50, height: CGFloat(getChartSize(temperature: temperature, maxSize: maxSize)))
                    .cornerRadius(10)
                Text("\(temperature)º").foregroundStyle(Color.white)
                    .padding(.top, 10)
            }
            Text(time)
            Image(systemName: "cloud.sun.rain.fill")
        }
    }
}

struct WeatherDay: View {
    var weekDay: String
    var date: Int
    var nightTemperature: Int
    var dayTemperatire: Int
    
    var body: some View {
        HStack (alignment: .center) {
            HStack {
                Image(systemName: "sun.max.fill")
                VStack {
                    Text(weekDay)
                    Text(String(date)).foregroundStyle(Color.gray)
                }.frame(width: 40)
            }
            HStack (spacing: 0) {
                Rectangle()
                    .fill(Color.blue.opacity(0.7))
                    .overlay(Text("\(nightTemperature)º"))
                    .frame(width: 50, height: 50)
                Text("\(dayTemperatire)º")
                    .frame(width: 50, height: 50)
                    .background(Color.blue)
                    .clipShape(
                        .rect(
                            bottomTrailingRadius: 10,
                            topTrailingRadius: 10
                        )
                    )
            }
        }
    }
}

func getChartSize(temperature: Int, maxSize: Int) -> Int {
    let maxTemperature = 40
    let result = abs(temperature) * maxSize / maxTemperature

    switch result {
        case 75...Int.max:
            return 75
        case Int.min..<40:
            return 40
        default:
            return result
    }
}

func setIndicatorAppearance() {
    UIPageControl.appearance().currentPageIndicatorTintColor = .gray
    UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
}

func toCelsius(kelvin: Double) -> Int {
    return Int(round(kelvin - 273.15))
}
