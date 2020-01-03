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
