//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Дмитрий Власов on 04.03.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .center, endPoint: .top).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("Omsk, Russia")
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                VStack (alignment: .leading) {
                    Text("Right now")
                    HStack (spacing: 16) {
                        Image(systemName: "cloud.drizzle.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        VStack (alignment: .leading) {
                            Text("-3º")
                                .font(.system(size: 70, weight: .bold))
                                .foregroundColor(.white)
                            Text("Feels like -9º")
                                .foregroundStyle(Color.gray)
                        }
                    }
                }
                VStack {
                    VStack (alignment: .leading) {
                        Text("Tonight and tomorrow")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Mostly clear tonight. Tomorrow will be a little warmer and partly cloudy.")
                    }.padding(.all, 15)
                    HStack (alignment: .bottom, spacing: 10) {
                        WeatherHour(time: "21:00", temperature: 0)
                        WeatherHour(time: "21:00", temperature: -15)
                        WeatherHour(time: "21:00", temperature: -34)
                        WeatherHour(time: "21:00", temperature: 34)
                        WeatherHour(time: "21:00", temperature: 50)
                        WeatherHour(time: "21:00", temperature: 99)
                    }.padding(.top, 20)
                }
                VStack {
                    VStack (alignment: .leading) {
                        Text("This week")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Partly cloudy starting tomorrow, with highs near 0º for most of the week.")
                    }.padding(.all, 15)
                    VStack {
                        WeatherDay(weekDay: "TUE", date: 21, nightTemperature: -13, dayTemperatire: 1)
                        WeatherDay(weekDay: "WED", date: 22, nightTemperature: -1, dayTemperatire: 14)
                        WeatherDay(weekDay: "FRI", date: 23, nightTemperature: -99, dayTemperatire: 99)
                        WeatherDay(weekDay: "SAT", date: 24, nightTemperature: 0, dayTemperatire: 1)
                        
                    }
                }
                Link(destination: URL(string: "https://google.com")!, label: {Text("About this data").underline()}).underline().padding(.top, 15)
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

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
