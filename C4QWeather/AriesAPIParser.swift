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
            if let dateTimeISO = AriesAPIParser.getParam(param: "dateTimeIso", period: period),
               let minTempF = AriesAPIParser.getParam(param: "minTempF", period: period),
               let maxTempF = AriesAPIParser.getParam(param: "maxTempF", period: period),
               let minTempC = AriesAPIParser.getParam(param: "minTempC", period: period),
               let maxTempC = AriesAPIParser.getParam(param: "maxTempC", period: period){
                
                print("###############################")
                print("dateTimeISO: \(dateTimeISO)")
                print("minTempF: \(minTempF)")
                print("maxTempF: \(maxTempF)")
                print("minTempC: \(minTempF)")
                print("maxTempC: \(maxTempF)")

                
                let day = Day(dateTimeISO: dateTimeISO, minTempF: minTempF, maxTempF: maxTempF, minTempC: minTempC, maxTempC: maxTempC)
                days.append(day)
                print(day)
                
            } else {
                print("Error: AriesDataParser")
            }
        }
        return days
    }


    static func getParam(param: String, period: [String : AnyObject]) -> String? {
        
        if let snippet = period[param] as? String {
            return snippet
        } else {
            print("Could not get param")
            return nil
        }
    }



}
