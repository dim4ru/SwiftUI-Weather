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
                ScrollView {
                    VStack (alignment: .leading) {
                        Text("Right now")
                            .font(.system(size: 42, weight: .bold, design: .default))
                            .foregroundColor(.white)
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
                        TabView {
                            HStack (alignment: .bottom, spacing: 10) {
                                WeatherHour(time: "21:00", temperature: 0)
                                WeatherHour(time: "21:00", temperature: -15)
                                WeatherHour(time: "21:00", temperature: -34)
                                WeatherHour(time: "21:00", temperature: 34)
                                WeatherHour(time: "21:00", temperature: 50)
                                WeatherHour(time: "21:00", temperature: 99)
                            }.padding(.top, 20)
                            HStack (alignment: .bottom, spacing: 10) {
                                WeatherHour(time: "00:00", temperature: 0)
                                WeatherHour(time: "00:00", temperature: -15)
                                WeatherHour(time: "00:00", temperature: -34)
                                WeatherHour(time: "00:00", temperature: 34)
                                WeatherHour(time: "00:00", temperature: 50)
                                WeatherHour(time: "00:00", temperature: 99)
                            }.padding(.top, 20)
                        }
                        .tabViewStyle(.page)
                        .frame(height: 230)
                        .onAppear {
                            setIndicatorAppearance()
                        }
                    }
                    VStack (alignment: .leading) {
                        Text("This week")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Partly cloudy starting tomorrow, with highs near 0º for most of the week.")
                    }.padding(.all, 15)
                    TabView {
                        VStack {
                            WeatherDay(weekDay: "TUE", date: 21, nightTemperature: -13, dayTemperatire: 1)
                            WeatherDay(weekDay: "WED", date: 22, nightTemperature: -1, dayTemperatire: 14)
                            WeatherDay(weekDay: "THU", date: 24, nightTemperature: 19, dayTemperatire: 0)
                            WeatherDay(weekDay: "FRI", date: 23, nightTemperature: -99, dayTemperatire: 99)
                            WeatherDay(weekDay: "SAT", date: 24, nightTemperature: 0, dayTemperatire: 1)
                            WeatherDay(weekDay: "SUN", date: 21, nightTemperature: -13, dayTemperatire: 1)
                            WeatherDay(weekDay: "MON", date: 22, nightTemperature: -1, dayTemperatire: 14)
                            WeatherDay(weekDay: "TUE", date: 23, nightTemperature: -99, dayTemperatire: 99)
                        }
                        Text("Datailed forecast is temporary unavailable")
                    }
                    .tabViewStyle(.page)
                    .frame(height: 550)
                    .onAppear {
                        setIndicatorAppearance()
                    }
                    Link(destination: URL(string: "https://google.com")!, label: {Text("About this data").underline()}).underline().padding(.top, 15)
                }
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

func setIndicatorAppearance() {
    UIPageControl.appearance().currentPageIndicatorTintColor = .gray
    UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
}
