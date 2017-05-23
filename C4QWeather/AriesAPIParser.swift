//
//  AriesAPIParser.swift
//  C4QWeather
//
//  Created by Zain Nadeem on 5/22/17.
//  Copyright © 2017 Zain Nadeem. All rights reserved.
//

import Foundation

struct AriesAPIParser {
    
    static func initializeDaysFromJSON(JSONArray: [[String : AnyObject]]) -> [Day] {
        
        var days = [Day]()
        
        for period in JSONArray {
            if let dateTimeISO = period["dateTimeISO"],
               let minTempF = period["minTempF"],
               let maxTempF = period["maxTempF"],
               let minTempC = period["minTempC"],
               let maxTempC = period["maxTempC"],
               let weatherPrimary = period["weatherPrimary"]{
                
                print("###############################")
                print("dateTimeISO: \(dateTimeISO)")
                print("minTempF: \(minTempF)")
                print("maxTempF: \(maxTempF)")
                print("minTempC: \(minTempC)")
                print("maxTempC: \(maxTempC)")
                print("weatherPrimary: \(weatherPrimary)")

                
                let day = Day(dateTimeISO: "\(dateTimeISO)", minTempF: "\(minTempF)", maxTempF: "\(maxTempF)", minTempC: "\(minTempC)", maxTempC: "\(maxTempC)", weatherPrimary: "\(weatherPrimary)")
                days.append(day)
                print(day)
                
            } else {
                print("Error: AriesDataParser")
            }
        }
        return days
    }

}
