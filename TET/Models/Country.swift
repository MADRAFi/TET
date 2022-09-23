//
//  Country.swift
//  TET
//
//  Created by MADRAFi on 15/09/2022.
//

import Foundation


struct Country: Codable {
    var id: Int
    var name: String
    var code: String
    var file: String
    var best_time: String
    var entry_point: String
    var exit_point: String
    var languages: String
    var currency: String
    var emergency: String
    var drive_side: String
    var wild_camping: String
    var trial_riding: String
    var bike_events: [String]
    var overview: String
    var not_miss: String
    var resources: [String]
    var images: [String]
    
//    private enum CodingKeys: String, CodingKey {
//        case id, country_name, best_time, entry_point, exit_point, languages, currency, emergency, drive_side, wild_camping, trial_riding,  bike_events, overview, not_miss, resources, images
//    }
    
    static let all: [Country] = Bundle.main.decode()
    static let example: Country = all[0]
}

extension Bundle {
    func decode<T: Decodable>() -> T {
        guard let url = self.url(forResource: "tet", withExtension: "json") else {
                fatalError("Cannot find tet.json file.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Unable to load data from the json")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Unable to decode data from the json")
        }
        return loadedData
    }
}
