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
                            Text("-3ºC")
                                .font(.system(size: 70, weight: .bold))
                                .foregroundColor(.white)
                            Text("Feels like -9")
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
                    HStack (spacing: 10) {
                        VStack {
                            ZStack (alignment: .top) {
                                Color.blue.frame(width: 50, height: 75)
                                    .cornerRadius(10)
                                Text("-3ºC").foregroundStyle(Color.white)
                                    .padding(.top, 10)
                            }
                            Text("21:00")
                            Image(systemName: "moon.stars")
                        }
                        VStack {
                            ZStack (alignment: .top) {
                                Color.blue.frame(width: 50, height: 75)
                                    .cornerRadius(10)
                                Text("-3ºC").foregroundStyle(Color.white)
                                    .padding(.top, 10)
                            }
                            Text("21:00")
                            Image(systemName: "moon.stars")
                        }
                        VStack {
                            ZStack (alignment: .top) {
                                Color.blue.frame(width: 50, height: 75)
                                    .cornerRadius(10)
                                Text("-3ºC").foregroundStyle(Color.white)
                                    .padding(.top, 10)
                            }
                            Text("21:00")
                            Image(systemName: "moon.stars")
                        }
                        VStack {
                            ZStack (alignment: .top) {
                                Color.blue.frame(width: 50, height: 75)
                                    .cornerRadius(10)
                                Text("-3ºC").foregroundStyle(Color.white)
                                    .padding(.top, 10)
                            }
                            Text("21:00")
                            Image(systemName: "moon.stars")
                        }
                        VStack {
                            ZStack (alignment: .top) {
                                Color.blue.frame(width: 50, height: 75)
                                    .cornerRadius(10)
                                Text("-3ºC").foregroundStyle(Color.white)
                                    .padding(.top, 10)
                            }
                            Text("21:00")
                            Image(systemName: "moon.stars")
                        }
                        VStack {
                            ZStack (alignment: .top) {
                                Color.blue.frame(width: 50, height: 75)
                                    .cornerRadius(10)
                                Text("-3ºC").foregroundStyle(Color.white)
                                    .padding(.top, 10)
                            }
                            Text("21:00")
                            Image(systemName: "moon.stars")
                        }
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
                        HStack{
                            Image(systemName: "sun.max.fill")
                            VStack {
                                Text("THU")
                                Text("21").foregroundStyle(Color.gray)
                            }
                            HStack (spacing: 0) {
                                Rectangle()
                                    .fill(Color.blue.opacity(0.7))
                                    .overlay(Text("-13º"))
                                    .frame(width: 50, height: 50)
                                Text("1º")
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
                        HStack{
                            Image(systemName: "sun.max.fill")
                            VStack {
                                Text("THU")
                                Text("21").foregroundStyle(Color.gray)
                            }
                            HStack (spacing: 0) {
                                Rectangle()
                                    .fill(Color.blue.opacity(0.7))
                                    .overlay(Text("-13º"))
                                    .frame(width: 50, height: 50)
                                Text("1º")
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
                        HStack{
                            Image(systemName: "sun.max.fill")
                            VStack {
                                Text("THU")
                                Text("21").foregroundStyle(Color.gray)
                            }
                            HStack (spacing: 0) {
                                Rectangle()
                                    .fill(Color.blue.opacity(0.7))
                                    .overlay(Text("-13º"))
                                    .frame(width: 50, height: 50)
                                Text("1º")
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
                Link(destination: URL(string: "https://google.com")!, label: {Text("About this data").underline()}).underline().padding(.top, 15)
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
