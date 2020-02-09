//
//  Utils.swift
//  SwiftAppDay2
//
//  Created by cse on 2020. 2. 4..
//  Copyright © 2020년 cse. All rights reserved.
//

import Foundation

class Utils: NSObject {
    
    static let shared = Utils()
    private override init() {
        super.init()
    }
    
    func makeNewDate()->TimeInterval {
        let date = Date()
        return date.timeIntervalSince1970
    }
    
    
    
    func timeString(time:TimeInterval)->String {
        let date = Date(timeIntervalSince1970: time)
        let dateFormatter = DateFormatter()
        let timezone = TimeZone.current.abbreviation() ?? "CET"  // get current TimeZone abbreviation or set to CET
        dateFormatter.timeZone = TimeZone(abbreviation: timezone) //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss.SSSS" //Specify your format that you want
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
}
