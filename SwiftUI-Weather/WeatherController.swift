//
//  WeatherController.swift
//  SwiftUI-Weather
//
//  Created by Дмитрий Власов on 24.03.2024.
//

import Foundation

class WeatherController {
    var url: URL?
    static let shared = WeatherController(); private init() {self.url = createURL()}
    
    private func createURL() -> URL? {
        guard let apiKey = getApiKey(), let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=54.985424150999584&lon=73.38738658760745&appid=\(apiKey)" as String? else {
            return nil
        }
        
        return URL(string: urlString)
    }

    func getApiKey() -> String? {
        // Оставьте вашу текущую реализацию функции getApiKey без изменений
        guard let plistPath = Bundle.main.path(forResource: "api-keys", ofType: "plist") else {
            print("Файл не найден")
            return nil
        }

        guard let plistData = FileManager.default.contents(atPath: plistPath),
              let plistDictionary = try? PropertyListSerialization.propertyList(from: plistData, format: nil) as? [String: Any] else {
            print("Ошибка чтения plist файла")
            return nil
        }

        if let apiKey = plistDictionary["OpenWeatherAPIKey"] as? String {
            return apiKey
        } else {
            return nil
        }
    }
    
    func fetchData(completion: @escaping (Result<Data, Error>) -> ()) {
        guard (url != nil) else {
            completion(.failure(NetworkError.badUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
            completion(.success(data))
        }.resume()
    }
}

enum NetworkError: Error {
    case badUrl, badRequest, badResponse
}
//54.985424150999584, 73.38738658760745
