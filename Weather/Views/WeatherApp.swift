//
//  WeatherApp.swift
//  Weather
//
//  Created by Venkatesh Nyamagoudar on 2/14/24.
//

import SwiftUI
import ios_weather_ui

@main
struct WeatherApp: App {
    let networkManager = NetworkManager()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(networkManager)
        }
    }
}
