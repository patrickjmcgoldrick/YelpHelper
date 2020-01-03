//
//  DetailData.swift
//  YelpHelper
//
//  Created by dirtbag on 1/2/20.
//  Copyright © 2020 dirtbag. All rights reserved.
//

import Foundation

public struct DetailData: Codable {
    public var name: String
    public var hours: [Hours]
    
    public func isOpenStatus() -> String {
        // is business open or closed?
        let isNowOpen = hours[0].is_open_now
        let hourData = hours[0].open
        let todayHours = hoursToday(days: hourData)
        
        if todayHours.count == 0 {
            return "Closed Today"
        } else {
            
            if isNowOpen {
                return "Open"
            } else {
                return "Closed"
            }
        }
    }
        
    public func todaysHours() -> String {
        
        let hourData = hours[0].open
        let todayHours = hoursToday(days: hourData)

        if todayHours.isEmpty {
            return ""
        }
        
        // format today's hours
        let formattedHours = formatTimeData(start: todayHours[0].start, end: todayHours[0].end)
        return formattedHours

    }
    
    private func hoursToday(days: [Day]) -> [Day] {
        let yelpWeekday = Date().getYelpWeekday()
        var resultDays = [Day]()
        for day in days {
            if day.day == yelpWeekday {
                resultDays.append(day)
            }
        }
        return resultDays
    }
    
    private func formatTimeData(start: String, end: String) -> String {
        
        guard let startHour = Int(start.prefix(2)) else { return "" }
        guard let endHour = Int(end.prefix(2)) else { return "" }
        guard let startMinutes = Int(start.suffix(2)) else { return "" }
        guard let endMinutes = Int(end.suffix(2)) else { return "" }
        
        return formatHour(hour: startHour, minutes: startMinutes)
            + " - " + formatHour(hour: endHour, minutes: endMinutes)
    }
    
    private func isPM(hour: Int) -> Bool {
        if hour > 11 {
            return true
        }
        return false
    }
    
    private func formatHour(hour: Int, minutes: Int) -> String {
        var resultString = ""
        
        if isPM(hour: hour) {
            resultString = "\(hour - 12)"
            if minutes != 0 {
                resultString += ":" + String(minutes)
            } else {
                resultString += ":00"
            }
            resultString += "PM"
        } else {
            resultString = String(hour)
            if minutes != 0 {
                resultString += ":" + String(minutes)
            } else {
                resultString += ":00"
            }
            resultString += "AM"
        }
        
        return resultString
    }

}

public struct Hours: Codable {
    public var open: [Day]
    public var is_open_now: Bool
    public var hours_type: String
}

public struct Day: Codable {
    public var day: Int
    public var start: String
    public var end: String
    public var is_overnight: Bool
}

