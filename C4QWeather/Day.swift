//
//  Day.swift
//  C4QWeather
//
//  Created by Zain Nadeem on 5/22/17.
//  Copyright © 2017 Zain Nadeem. All rights reserved.
//

import Foundation

import UIKit

class Day {
    let dateTimeISO:    String
    let minTempF:       String
    let maxTempF:       String
    let minTempC:       String
    let maxTempC:       String
    let weatherPrimary: String


    
    init(dateTimeISO: String, minTempF: String, maxTempF: String, minTempC: String, maxTempC: String, weatherPrimary: String) {
        self.dateTimeISO = dateTimeISO
        self.minTempF = minTempF
        self.maxTempF = maxTempF
        self.minTempC = minTempC
        self.maxTempC = maxTempC
        self.weatherPrimary = weatherPrimary

}

}
