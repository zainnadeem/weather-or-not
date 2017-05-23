//
//  APIClientAries.swift
//  C4QWeather
//
//  Created by Zain Nadeem on 5/22/17.
//  Copyright © 2017 Zain Nadeem. All rights reserved.
//

import Foundation
import Alamofire

struct AriesApiClient {

    typealias DayCompletion = ([Day], Error?) -> ()
    
    enum AriesAPIError: Error {
        case JSONParseError
    }
    
    static func getDaysWithCompletion(completion: @escaping DayCompletion) {
        
        Alamofire.request("https://api.aerisapi.com/forecasts/11101?client_id=\(accessKey)&client_secret=\(secretKey)")
            .responseJSON { response in
                
                switch response.result {
                case .failure(let error):
                    completion([Day](), error)
                    
                case .success(let value):
                    guard let responseValue = value as? NSDictionary else { completion([Day](), AriesAPIError.JSONParseError); return }
                    
                    print(responseValue)
                    
                    guard let responseDictionary = responseValue["response"] as? [[String : AnyObject]]
                        else { completion([Day](), AriesAPIError.JSONParseError); return }
                    
                    
                    guard let arrayOfDays = responseDictionary[0]["periods"] as? [[String: AnyObject]] else { completion([Day](), AriesAPIError.JSONParseError); return }
                    
                    completion(AriesAPIParser.initializeDaysFromJSON(JSONArray: arrayOfDays), nil)
                }
        }
    }
}
