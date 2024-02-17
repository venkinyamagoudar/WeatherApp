//
//  ContentView.swift
//  Weather
//
//  Created by Venkatesh Nyamagoudar on 2/14/24.
//

import SwiftUI
import ios_weather_ui

struct MainView: View {
    @EnvironmentObject var networkManager: NetworkManager
    var body: some View {
        NavigationView{
            NavigationLink {
                WeatherView()
                    .environmentObject(networkManager)
            } label: {
                Text("Check Weather")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    MainView()
}
