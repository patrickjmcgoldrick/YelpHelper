//
//  Date_Extension.swift
//  YelpHelper
//
//  Created by dirtbag on 1/3/20.
//  Copyright © 2020 dirtbag. All rights reserved.
//

import Foundation

public extension Date {

    func getWeekday() -> Int {
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: self)
        return weekDay
    }

    func getYelpWeekday() -> Int {
        return (getWeekday() + 5) % 7
    }
}
