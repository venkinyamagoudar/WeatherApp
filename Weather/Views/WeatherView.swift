//
//  WeatherView.swift
//  Weather
//
//  Created by Venkatesh Nyamagoudar on 2/15/24.
//

import SwiftUI
import ios_weather_ui

struct WeatherView: View {
    @EnvironmentObject var networkManager: NetworkManager
    @State var dailyPrediction: DailyPrediction?
    
    var body: some View {
        WeatherDetailView(dailyPrediction: $dailyPrediction)
            .onAppear {
                fetchWeather()
            }
        
        Spacer()
        if let forecast = dailyPrediction?.forecast.forecastday {
            PredictionView(predictions: forecast)
        }
        
    }
    
    func fetchWeather() {
        let url = "https://api.weatherapi.com/v1/forecast.json?key=caa3496acf20492683e152918241502&q=London&days=10&aqi=no&alerts=no"
        networkManager.extractJsonData(from: url) { result in
            switch result {
            case .failure(let error):
                print("\(error)")
            case .success(let data):
                networkManager.parseJsonData(jsonData: data) {[self] result in
                    switch result {
                    case .success(let data):
                        print(data)
                        self.dailyPrediction = data
                    case .failure(let error):
                        print("\(error)")
                    }
                }
            }
        }
    }
}

//#Preview {
//    WeatherView(dailyPrediction: .constant())
//}
