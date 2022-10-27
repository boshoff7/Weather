//
//  WeatherManager.swift
//  Weather
//
//  Created by Chris Boshoff on 2022/10/26.
//

import Foundation

//protocol WeatherManagerDelegate {
//    func fetchDaily(_ daily: [Daily])
//    func fetchCurrent(_ current: [Current])
//}
//
//class WeatherManager {
//    
//    var delegate: WeatherManagerDelegate?
//    
//    func fetchWeather() {
//        
//        let urlString = "https://api.openweathermap.org/data/3.0/onecall?lat=20.8&lon=2.55&appid=ed8f0f94d3c69f0f9b8991279f8be38b"
//        
//        let url = URL(string: urlString)
//        
//        guard url != nil else { return }
//        
//        let session = URLSession.shared
//        
//        let dataTask = session.dataTask(with: url!) { data, response, error in
//            if error == nil && data != nil {
//                let decoder = JSONDecoder()
//                do {
//                    let weather = try decoder.decode(WeatherData.self, from: data!)
//                    let daily = weather.daily
//                    let current = weather.current
//                    
//                    DispatchQueue.main.async {
////                        self.delegate?.fetchDaily(daily)
////                        self.delegate?.fetchCurrent(current)
//                    }
//                } catch {
//                    
//                }
//            }
//        }
//    }
//}
